import SwiftUI

// MARK: - 化学主题（章节）

enum ChemTopic: String, Codable, CaseIterable, Identifiable {
    // 初中
    case phenomena        // 身边的化学·物质与变化
    case massConservation // 质量守恒与方程式
    case acidBaseSalt     // 酸碱盐与金属活动性
    // 高中
    case mole             // 物质的量
    case ionReaction      // 离子反应
    case redox            // 氧化还原
    case metals           // 金属及其化合物
    case nonmetals        // 非金属及其化合物
    case periodicLaw      // 物质结构与周期律
    case energy           // 化学反应与能量
    case equilibrium      // 速率与平衡
    case solution         // 水溶液中的离子平衡
    case electrochem      // 电化学
    case organic          // 有机化学
    case experiment       // 化学实验
    // 竞赛
    case structure        // 结构化学

    var id: String { rawValue }

    var name: String {
        switch self {
        case .phenomena:        return "物质与变化"
        case .massConservation: return "质量守恒"
        case .acidBaseSalt:     return "酸碱盐"
        case .mole:             return "物质的量"
        case .ionReaction:      return "离子反应"
        case .redox:            return "氧化还原"
        case .metals:           return "金属及其化合物"
        case .nonmetals:        return "非金属及其化合物"
        case .periodicLaw:      return "结构与周期律"
        case .energy:           return "反应与能量"
        case .equilibrium:      return "速率与平衡"
        case .solution:         return "水溶液离子平衡"
        case .electrochem:      return "电化学"
        case .organic:          return "有机化学"
        case .experiment:       return "化学实验"
        case .structure:        return "结构化学"
        }
    }

    var stage: Stage {
        switch self {
        case .phenomena, .massConservation, .acidBaseSalt: return .junior
        case .structure: return .olympiad
        default: return .senior
        }
    }

    var icon: String {
        switch self {
        case .phenomena:        return "eye"
        case .massConservation: return "scalemass"
        case .acidBaseSalt:     return "flask"
        case .mole:             return "number.circle"
        case .ionReaction:      return "drop"
        case .redox:            return "arrow.left.arrow.right"
        case .metals:           return "cube"
        case .nonmetals:        return "wind"
        case .periodicLaw:      return "tablecells"
        case .energy:           return "flame"
        case .equilibrium:      return "arrow.triangle.2.circlepath"
        case .solution:         return "testtube.2"
        case .electrochem:      return "bolt"
        case .organic:          return "hexagon"
        case .experiment:       return "flask.fill"
        case .structure:        return "atom"
        }
    }
}

// MARK: - 武器库（化学巧算/守恒思想）

enum ChemWeapon: String, Codable, CaseIterable, Identifiable {
    // 初中
    case massConservation   // 质量守恒
    case valenceRule        // 化合价规则
    case solubilityCurve    // 溶解度曲线读图
    // 高中
    case electronConservation // 电子守恒
    case chargeConservation   // 电荷守恒
    case atomConservation     // 原子守恒
    case differenceMethod     // 差量法
    case extremeValue         // 极值法
    case crossMethod          // 十字交叉法
    case relationMethod       // 关系式法
    case averageMethod        // 平均值法
    // 竞赛
    case hessCycle            // 热力学循环
    case orbitalSymmetry      // 轨道与对称

    var id: String { rawValue }

    var name: String {
        switch self {
        case .massConservation:     return "质量守恒"
        case .valenceRule:          return "化合价规则"
        case .solubilityCurve:      return "溶解度曲线"
        case .electronConservation: return "电子守恒"
        case .chargeConservation:   return "电荷守恒"
        case .atomConservation:     return "原子守恒"
        case .differenceMethod:     return "差量法"
        case .extremeValue:         return "极值法"
        case .crossMethod:          return "十字交叉法"
        case .relationMethod:       return "关系式法"
        case .averageMethod:        return "平均值法"
        case .hessCycle:            return "热力学循环"
        case .orbitalSymmetry:      return "轨道与对称"
        }
    }

    var stage: Stage {
        switch self {
        case .massConservation, .valenceRule, .solubilityCurve: return .junior
        case .hessCycle, .orbitalSymmetry: return .olympiad
        default: return .senior
        }
    }

    /// 一句话说明这把武器"看穿"了什么。
    var insight: String {
        switch self {
        case .massConservation:     return "反应前后原子不增不减，总质量恒定"
        case .valenceRule:          return "化合物中正负化合价代数和为零"
        case .solubilityCurve:      return "曲线上的点 = 该温度下的饱和状态"
        case .electronConservation: return "氧化剂得电子总数 = 还原剂失电子总数"
        case .chargeConservation:   return "溶液中正电荷总量 = 负电荷总量"
        case .atomConservation:     return "某元素的原子在变化前后总数不变"
        case .differenceMethod:     return "抓住反应前后的质量/体积差，一步定量"
        case .extremeValue:         return "假设全是 A 或全是 B，真实答案夹在中间"
        case .crossMethod:          return "平均值一定介于两个分量之间，差值定比例"
        case .relationMethod:       return "多步反应找首尾物质的摩尔关系，一步到位"
        case .averageMethod:        return "混合物的平均摩尔质量介于组分之间"
        case .hessCycle:            return "状态函数只看始末，设计循环绕开未知"
        case .orbitalSymmetry:      return "电子排布与对称性决定性质"
        }
    }

    var icon: String {
        switch self {
        case .massConservation:     return "scalemass"
        case .valenceRule:          return "plusminus"
        case .solubilityCurve:      return "chart.xyaxis.line"
        case .electronConservation: return "e.circle"
        case .chargeConservation:   return "plus.forwardslash.minus"
        case .atomConservation:     return "atom"
        case .differenceMethod:     return "minus.circle"
        case .extremeValue:         return "arrow.up.and.down"
        case .crossMethod:          return "xmark"
        case .relationMethod:       return "link"
        case .averageMethod:        return "equal.circle"
        case .hessCycle:            return "arrow.triangle.2.circlepath.circle"
        case .orbitalSymmetry:      return "circle.hexagongrid"
        }
    }
}

// MARK: - 题目与双解对决

/// 解法路径：一组按顺序展开的步骤。
struct SolutionPath: Codable {
    let title: String        // 如 "常规解：列方程联立"
    let steps: [String]
    let timeMinutes: Double  // 估计耗时（分钟）
}

/// 双解对决：常规解 vs 守恒之眼。
struct DualSolution: Codable {
    let standard: SolutionPath
    let descent: SolutionPath
    let weapon: ChemWeapon
    var principle: String = ""   // 为什么能这么秒（原理）：讲清方法为何成立，让学生看懂所以然
    let keyInsight: String       // 一句话武器洞察
    let plainTalk: String        // 说人话：给完全没听懂的同学
    var timeRatio: Double { max(standard.timeMinutes / max(descent.timeMinutes, 0.1), 1) }
}

struct ChemProblem: Codable, Identifiable {
    let id: String
    let stage: Stage
    let topic: ChemTopic
    let content: String
    let options: [String]
    let answerIndex: Int
    let explanation: String
    var nodeId: String? = nil          // 所属主线节点
    var weapon: ChemWeapon? = nil      // 这道题主要训练的解题武器（方法教练标签）
    var dualSolution: DualSolution? = nil
}

// MARK: - 武器教学：把「方法」从名字变成可教的能力
// 何时用(识局) → 怎么用(步骤) → 看对决(例题) → 去练习(挂该武器的题)。

struct WeaponGuide: Identifiable {
    let weapon: ChemWeapon
    let tagline: String          // 一句话定位，如「氧化还原压轴一行拿下」
    let whenToUse: [String]      // 识局信号：什么样的题该亮出这把武器
    let steps: [String]          // 方法步骤
    let exampleCaseId: String?   // 守恒之眼对决例题（Boss 题 id）
    var id: String { weapon.rawValue }
}
