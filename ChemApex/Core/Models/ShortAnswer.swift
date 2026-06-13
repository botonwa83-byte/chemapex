import Foundation

// MARK: - 简答题训练：攻大题文字题「会做但答不到采分点」
// 给问题 → 自己组织答案 → 翻开标准答案 + 采分点 → 逐条勾选踩到几个点（诚实自评）。

struct ShortAnswer: Codable, Identifiable {
    let id: String
    let category: String      // 检验 / 解释原因 / 描述现象 / 实验操作
    let stage: Stage
    let question: String
    let answer: String        // 标准答案（规范化学语言）
    let scorePoints: [String] // 采分点（每条是一个得分要点）
    var tip: String? = nil    // 答题套路提示
}

// MARK: - 战绩

final class ShortAnswerManager: ObservableObject {
    static let shared = ShortAnswerManager()
    private let storageKey = "shortanswer_mastered_v1"

    /// 自评「答全了」（采分点全踩到）的题 id。
    @Published private(set) var mastered: Set<String> = []

    private init() {
        mastered = Set(UserDefaults.standard.stringArray(forKey: storageKey) ?? [])
    }

    func mark(_ id: String, full: Bool) {
        if full { mastered.insert(id) } else { mastered.remove(id) }
        UserDefaults.standard.set(Array(mastered), forKey: storageKey)
    }

    func isMastered(_ id: String) -> Bool { mastered.contains(id) }
    var masteredCount: Int { mastered.count }
}
