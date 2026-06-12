import Foundation

// MARK: - 学习主线「登顶之路」：ChemApex 的脊梁
// 一条线性主线，从山脚(初中现象)到山顶(竞赛结构)。
// 每个节点 = 学(知识点) → 练(题目) → 战(Boss 守恒之眼战例)。

struct KnowledgePoint: Codable, Identifiable {
    let id: String
    let title: String     // 如 "电子守恒"
    let detail: String    // 展开讲解
    var pitfall: String? = nil  // 常见误区
}

struct LearningNode: Codable, Identifiable {
    let id: String
    let order: Int               // 主线序号（1 起）
    let stage: Stage
    let topic: ChemTopic
    let title: String            // 如 "氧化还原 · 电子的转移"
    let tagline: String          // 一句话点题
    let knowledgePoints: [KnowledgePoint]
    let problemIds: [String]     // 关卡题目
    var bossCaseId: String? = nil   // Boss：守恒之眼战例（ChemProblem.id，带 dualSolution）
    var weaponUnlocked: ChemWeapon? = nil  // 通关解锁的武器
}

/// 节点在主线上的状态。
enum NodeState {
    case locked      // 未解锁
    case current     // 当前推进中
    case completed   // 已通关
}
