import Foundation

// MARK: - 化学神探：推断题 = 破案游戏
// 一个案件 = 谜底物质 + 嫌疑人列表 + 线索链。
// 玩法：逐条揭线索，随时指认；揭得越少猜中，星级越高；错猜降星。

struct DetectiveClue: Codable, Identifiable {
    let id: String
    let text: String        // 线索本身（侦探口吻）
    let deduction: String   // 这条线索的推理价值：排除了谁 / 锁定了什么
}

struct DetectiveCase: Codable, Identifiable {
    let id: String
    let title: String           // 案件名，如 "淡黄色嫌疑人"
    let stage: Stage
    let topic: ChemTopic
    let suspects: [String]      // 嫌疑物质（含谜底）
    let answerIndex: Int
    let clues: [DetectiveClue]
    let verdict: String         // 结案陈词：完整解析

    var answer: String { suspects[answerIndex] }
}

// MARK: - 探案进度（星级存档）

final class DetectiveManager: ObservableObject {
    static let shared = DetectiveManager()
    private let storageKey = "detective_stars_v1"

    /// caseId -> 最佳星级 1...3
    @Published private(set) var bestStars: [String: Int] = [:]

    private init() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([String: Int].self, from: data) {
            bestStars = decoded
        }
    }

    func record(caseId: String, stars: Int) {
        if stars > (bestStars[caseId] ?? 0) {
            bestStars[caseId] = stars
            if let data = try? JSONEncoder().encode(bestStars) {
                UserDefaults.standard.set(data, forKey: storageKey)
            }
        }
    }

    var solvedCount: Int { bestStars.count }
    var totalStars: Int { bestStars.values.reduce(0, +) }

    /// 计星规则：揭开 ≤2 条线索猜中 = 3 星，3 条 = 2 星，更多 = 1 星；每次错猜降 1 星，保底 1 星。
    static func stars(cluesRevealed: Int, wrongGuesses: Int) -> Int {
        let base = cluesRevealed <= 2 ? 3 : (cluesRevealed == 3 ? 2 : 1)
        return max(base - wrongGuesses, 1)
    }
}
