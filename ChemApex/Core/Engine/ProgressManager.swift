import Foundation
import SwiftUI

// MARK: - 进度引擎：练习记录 + 主线解锁 + 连击
// 主线规则：节点内答对 ≥60% 题目 → 通关，点亮下一节点。

struct ProblemStats: Codable {
    var attempts: Int = 0
    var correct: Int = 0
    var everCorrect: Bool = false
    var flagged: Bool = false   // 手动 ⭐ 收藏进错题本
    var accuracy: Double { attempts == 0 ? 0 : Double(correct) / Double(attempts) }
}

final class ProgressManager: ObservableObject {
    static let shared = ProgressManager()

    @Published private(set) var stats: [String: ProblemStats] = [:]   // problemId ->
    @Published private(set) var viewedBossCases: Set<String> = []     // 看过的守恒之眼战例
    @Published private(set) var practiceDays: [String] = []           // "yyyy-MM-dd"

    private let statsKey = "practice_stats_v1"
    private let bossKey = "viewed_boss_cases_v1"
    private let daysKey = "practice_days_v1"

    private init() { load() }

    // MARK: 练习记录

    func stats(for problemId: String) -> ProblemStats { stats[problemId] ?? ProblemStats() }

    func record(problemId: String, correct: Bool) {
        var s = stats(for: problemId)
        s.attempts += 1
        if correct { s.correct += 1; s.everCorrect = true }
        stats[problemId] = s
        touchToday()
        save()
        // 同步进入艾宾浩斯复习排期
        ReviewScheduler.shared.recordAnswer(problemId: problemId, correct: correct)
    }

    func toggleFlag(problemId: String) {
        var s = stats(for: problemId)
        s.flagged.toggle()
        stats[problemId] = s
        save()
    }

    func markBossViewed(_ caseId: String) {
        viewedBossCases.insert(caseId)
        save()
    }

    /// 错题本 = 答错过且尚未答对 ∪ 手动收藏。
    func errorProblems(from all: [ChemProblem]) -> [ChemProblem] {
        all.filter { p in
            let s = stats(for: p.id)
            return s.flagged || (s.attempts > s.correct && !s.everCorrect)
        }
    }

    // MARK: 主线进度

    /// 节点完成度 0...1：答对过的题数 / 节点题数。
    func nodeProgress(_ node: LearningNode) -> Double {
        guard !node.problemIds.isEmpty else { return 0 }
        let solved = node.problemIds.filter { stats(for: $0).everCorrect }.count
        return Double(solved) / Double(node.problemIds.count)
    }

    func isNodeCompleted(_ node: LearningNode) -> Bool {
        nodeProgress(node) >= 0.6 - 1e-9
    }

    /// 主线节点状态：所有章节自由开放（不再强制顺序锁，方便复习时直奔弱项）。
    /// 已通关 → completed；其余 → current（可进可练）。付费锁是另一把锁，由 PurchaseManager 管。
    func nodeState(_ node: LearningNode, in line: [LearningNode]) -> NodeState {
        isNodeCompleted(node) ? .completed : .current
    }

    /// 当前推进到的节点（第一个未完成的）。
    func currentNode(in line: [LearningNode]) -> LearningNode? {
        line.first { !isNodeCompleted($0) } ?? line.last
    }

    var completedNodeCount: Int {
        MainLineData.nodes.filter { isNodeCompleted($0) }.count
    }

    /// 已解锁的武器（通关带武器的节点即解锁）。
    var unlockedWeapons: [ChemWeapon] {
        MainLineData.nodes.compactMap { node in
            guard let w = node.weaponUnlocked, isNodeCompleted(node) else { return nil }
            return w
        }
    }

    // MARK: 连击（连续学习天数）

    private func touchToday() {
        let today = Self.dayString(Date())
        if practiceDays.last != today { practiceDays.append(today) }
    }

    var streak: Int {
        let fmt = Self.dayFormatter
        var streak = 0
        var cursor = Date()
        let days = Set(practiceDays)
        // 今天没练不打断昨天的连击
        if !days.contains(Self.dayString(cursor)) {
            cursor = Calendar.current.date(byAdding: .day, value: -1, to: cursor)!
        }
        while days.contains(fmt.string(from: cursor)) {
            streak += 1
            cursor = Calendar.current.date(byAdding: .day, value: -1, to: cursor)!
        }
        return streak
    }

    var totalAttempts: Int { stats.values.reduce(0) { $0 + $1.attempts } }
    var totalCorrect: Int { stats.values.reduce(0) { $0 + $1.correct } }

    private static let dayFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd"
        return f
    }()
    private static func dayString(_ d: Date) -> String { dayFormatter.string(from: d) }

    // MARK: 持久化

    private func save() {
        let ud = UserDefaults.standard
        if let data = try? JSONEncoder().encode(stats) { ud.set(data, forKey: statsKey) }
        ud.set(Array(viewedBossCases), forKey: bossKey)
        ud.set(practiceDays, forKey: daysKey)
    }

    private func load() {
        let ud = UserDefaults.standard
        if let data = ud.data(forKey: statsKey),
           let decoded = try? JSONDecoder().decode([String: ProblemStats].self, from: data) {
            stats = decoded
        }
        viewedBossCases = Set(ud.stringArray(forKey: bossKey) ?? [])
        practiceDays = ud.stringArray(forKey: daysKey) ?? []
    }
}
