import SwiftUI

// MARK: - 元素：元素星图的基本单元

enum ElementCategory: String, Codable {
    case alkaliLike   // 活泼金属（碱金属/碱土金属等主族金属）
    case transition   // 过渡金属
    case metalloid    // 准金属
    case nonmetal     // 非金属
    case halogen      // 卤素
    case nobleGas     // 稀有气体

    var name: String {
        switch self {
        case .alkaliLike: return "主族金属"
        case .transition: return "过渡金属"
        case .metalloid:  return "准金属"
        case .nonmetal:   return "非金属"
        case .halogen:    return "卤素"
        case .nobleGas:   return "稀有气体"
        }
    }

    var color: Color {
        switch self {
        case .alkaliLike: return .elementMetal
        case .transition: return .elementTransition
        case .metalloid:  return .apexGold
        case .nonmetal:   return .elementNonmetal
        case .halogen:    return .apexLava
        case .nobleGas:   return .elementNoble
        }
    }
}

struct Element: Codable, Identifiable {
    let number: Int        // 原子序数
    let symbol: String
    let name: String       // 中文名
    let period: Int        // 周期 1-7
    let group: Int         // 族（IUPAC 1-18 列）
    let category: ElementCategory
    let examHeat: Int      // 高考考点热度 0-3（3 = 必考核心）
    var flameColor: String? = nil      // 焰色（仅有焰色反应考点的元素）
    var examPoints: [String] = []      // 高考考点
    var pitfalls: [String] = []        // 常见误用/易错
    var firstStage: Stage = .senior    // 哪个段位开始点亮

    var id: Int { number }
}
