import Foundation

// MARK: - 智能复习：艾宾浩斯间隔重复（移植自 PhysicsApex 模式）
// 做过的题自动排期：1/3/7/15/30/60 天。答对进入下一档，答错回到 1 天。

struct ReviewItem: Codable, Identifiable {
    let problemId: String
    var intervalIndex: Int      // 0...5 对应天数表
    var nextReview: Date
    var correctStreak: Int

    var id: String { problemId }

    var daysUntilReview: Int {
        let days = Calendar.current.dateComponents([.day], from: Date(), to: nextReview).day ?? 0
        return max(days, 0)
    }
}

final class ReviewScheduler: ObservableObject {
    static let shared = ReviewScheduler()
    static let intervals = [1, 3, 7, 15, 30, 60]   // 天

    @Published private(set) var items: [String: ReviewItem] = [:]
    private let storageKey = "review_items_v1"

    private init() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([String: ReviewItem].self, from: data) {
            items = decoded
        }
    }

    // MARK: 排期

    func recordAnswer(problemId: String, correct: Bool) {
        var item = items[problemId]
            ?? ReviewItem(problemId: problemId, intervalIndex: 0, nextReview: Date(), correctStreak: 0)
        if correct {
            item.correctStreak += 1
            item.intervalIndex = min(item.intervalIndex + 1, Self.intervals.count - 1)
        } else {
            item.correctStreak = 0
            item.intervalIndex = 0
        }
        let days = Self.intervals[item.intervalIndex]
        item.nextReview = Calendar.current.date(byAdding: .day, value: days, to: Date()) ?? Date()
        items[problemId] = item
        save()
    }

    /// 静态排期逻辑（便于单元测试）：返回(新档位, 间隔天数)。
    static func nextInterval(current: Int, correct: Bool) -> (index: Int, days: Int) {
        let idx = correct ? min(current + 1, intervals.count - 1) : 0
        return (idx, intervals[idx])
    }

    // MARK: 查询

    func dueProblems(now: Date = Date()) -> [ReviewItem] {
        items.values
            .filter { $0.nextReview <= now }
            .sorted { $0.nextReview < $1.nextReview }
    }

    func upcomingProblems(now: Date = Date()) -> [ReviewItem] {
        items.values
            .filter { $0.nextReview > now }
            .sorted { $0.nextReview < $1.nextReview }
    }

    func reviewItem(for problemId: String) -> ReviewItem? { items[problemId] }

    var dueCount: Int { dueProblems().count }
    var totalScheduled: Int { items.count }

    private func save() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}
