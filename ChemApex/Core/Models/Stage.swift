import SwiftUI

// MARK: - 段位系统：Apex 家族的脊梁
// 三段递进：初中看现象 → 高中练守恒(主战场) → 竞赛看结构。

enum Stage: String, Codable, CaseIterable, Identifiable {
    case junior    // 初中
    case senior    // 高中（主战场）
    case olympiad  // 竞赛（天花板）

    var id: String { rawValue }

    var title: String {
        switch self {
        case .junior:   return "初中 · 看现象"
        case .senior:   return "高中 · 练守恒"
        case .olympiad: return "竞赛 · 看结构"
        }
    }

    var shortTitle: String {
        switch self {
        case .junior:   return "初中"
        case .senior:   return "高中"
        case .olympiad: return "竞赛"
        }
    }

    var emoji: String {
        switch self {
        case .junior:   return "🌱"
        case .senior:   return "⚗️"
        case .olympiad: return "👁"
        }
    }

    var subtitle: String {
        switch self {
        case .junior:   return "现象 · 变化 · 质量守恒"
        case .senior:   return "守恒 · 推断 · 高考主线"
        case .olympiad: return "晶体 · 轨道 · 结构之眼"
        }
    }

    var color: Color {
        switch self {
        case .junior:   return .stageJunior
        case .senior:   return .stageSenior
        case .olympiad: return .stageOlympiad
        }
    }

    /// 段位顺序（用于解锁判断）。
    var rank: Int {
        switch self {
        case .junior:   return 0
        case .senior:   return 1
        case .olympiad: return 2
        }
    }

    /// 当前段位是否已解锁 `other` 段位的内容。
    func unlocks(_ other: Stage) -> Bool { other.rank <= rank }
}
