import Foundation

// MARK: - 配平训练：把「不会写方程式」从看变成练
// 给没配平的方程式骨架，学生动手填系数，当场判对错。

struct BalanceProblem: Codable, Identifiable {
    let id: String
    let stage: Stage
    let reactants: [String]   // 反应物（不带系数），如 ["H₂", "O₂"]
    let products: [String]    // 生成物
    let answer: [Int]         // 最简整数系数，顺序为 reactants + products
    let condition: String
    let hint: String          // 配平思路提示

    var species: [String] { reactants + products }
}

// MARK: - 配平战绩

final class BalanceManager: ObservableObject {
    static let shared = BalanceManager()
    private let storageKey = "balance_solved_v1"

    @Published private(set) var solved: Set<String> = []

    private init() {
        solved = Set(UserDefaults.standard.stringArray(forKey: storageKey) ?? [])
    }

    func markSolved(_ id: String) {
        solved.insert(id)
        UserDefaults.standard.set(Array(solved), forKey: storageKey)
    }

    var solvedCount: Int { solved.count }

    /// 判断用户填的系数是否正确（允许等比例但要求最简整数）。
    static func isCorrect(_ user: [Int], answer: [Int]) -> Bool {
        guard user.count == answer.count, !user.contains(where: { $0 < 1 }) else { return false }
        // 必须与最简整数系数完全一致（answer 已是最简）。
        return user == answer
    }
}
