import Foundation

// MARK: - 方程式默写训练：把「只能看」的方程式变成「练默写」
// 攻化学最痛的两点：记不住方程式、不会写方程式。
// 玩法：给章节/考点/现象提示 → 脑中默写 → 翻开对答案 → 自评「记住了/没记住」。

final class EquationDrillManager: ObservableObject {
    static let shared = EquationDrillManager()
    private let storageKey = "equation_drill_mastered_v1"

    /// 已「记住」的方程式 id 集合。
    @Published private(set) var mastered: Set<String> = []

    private init() {
        mastered = Set(UserDefaults.standard.stringArray(forKey: storageKey) ?? [])
    }

    func isMastered(_ id: String) -> Bool { mastered.contains(id) }

    func mark(_ id: String, mastered ok: Bool) {
        if ok { mastered.insert(id) } else { mastered.remove(id) }
        UserDefaults.standard.set(Array(mastered), forKey: storageKey)
    }

    /// 某一组方程式的掌握数。
    func masteredCount(in equations: [ChemEquation]) -> Int {
        equations.filter { mastered.contains($0.id) }.count
    }
}
