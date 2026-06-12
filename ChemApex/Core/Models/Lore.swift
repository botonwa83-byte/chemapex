import Foundation

// MARK: - 情感钩子：化学巨人 + 毒与火档案馆

/// 化学巨人（复用 PhysicsApex 的 Giant/Hero 框架）。
struct ChemGiant: Codable, Identifiable {
    let id: String
    let name: String
    let era: String          // 年代
    let title: String        // 头衔，如 "周期表的梦想家"
    let achievement: String  // 主要成就
    let quote: String        // 金句
    let story: String        // 小传
    // RPG 属性 0-100
    let insight: Int     // 洞察
    let creation: Int    // 创造
    let grit: Int        // 毅力
    let impact: Int      // 影响
}

/// 毒与火档案馆：化学史故事，篇末必须钩回考点。
struct ChemStory: Codable, Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let body: String
    let examHook: String   // 钩回考点："氟为什么这么凶？→ 电负性最大"
    let icon: String       // SF Symbol
}
