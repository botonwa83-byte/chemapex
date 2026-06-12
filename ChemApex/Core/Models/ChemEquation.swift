import Foundation

// MARK: - 方程式剧本：方程式不是公式，是"剧本"
// 每条 = 条件 + 现象 + 考点 + 陷阱（少量/过量分岔是高考最爱的坑）。

struct ChemEquation: Codable, Identifiable {
    let id: String
    let stage: Stage
    let topic: ChemTopic
    let formula: String        // 配平后的方程式（Unicode 上下标）
    let condition: String      // 反应条件：点燃 / Δ / 催化剂 / 电解 / 常温…
    let phenomenon: String     // 实验现象（必须准确）
    let examPoint: String      // 高考考点
    var trap: String? = nil    // 陷阱（少量/过量、浓/稀分岔等）
    var ionic: String? = nil   // 离子方程式（如适用）
}
