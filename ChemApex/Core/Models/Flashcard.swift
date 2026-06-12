import SwiftUI

// MARK: - 现象闪卡：化学的颜色记忆负担，做成配对游戏

enum FlashCategory: String, Codable, CaseIterable, Identifiable {
    case flame        // 焰色反应
    case solution     // 溶液与离子
    case precipitate  // 沉淀
    case solidGas     // 固体与气体

    var id: String { rawValue }

    var name: String {
        switch self {
        case .flame:       return "焰色反应"
        case .solution:    return "溶液与离子"
        case .precipitate: return "沉淀颜色"
        case .solidGas:    return "固体与气体"
        }
    }

    var icon: String {
        switch self {
        case .flame:       return "flame"
        case .solution:    return "drop"
        case .precipitate: return "arrow.down.to.line"
        case .solidGas:    return "cube"
        }
    }

    var subtitle: String {
        switch self {
        case .flame:       return "Na 黄 K 紫…灼烧的签名"
        case .solution:    return "蓝的黄的绿的，离子的底色"
        case .precipitate: return "推断题最爱考的沉淀色谱"
        case .solidGas:    return "黄绿的气、淡黄的粉、紫黑的晶"
        }
    }
}

struct ColorFact: Codable, Identifiable {
    let id: String
    let category: FlashCategory
    let item: String        // 物质/微粒，如 "钾 K（焰色）"
    let colorName: String   // 颜色文字，如 "紫色"
    let hex: UInt32         // 色块颜色
    var note: String? = nil // 备注/陷阱，如 "透过蓝色钴玻璃观察"

    var color: Color { Color(UIColor(hex6: hex)) }
}

// MARK: - 闪卡战绩

final class FlashcardManager: ObservableObject {
    static let shared = FlashcardManager()
    private let storageKey = "flashcard_best_v1"

    /// category.rawValue -> 最佳得分（一轮 10 题中答对数）
    @Published private(set) var bestScores: [String: Int] = [:]

    private init() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([String: Int].self, from: data) {
            bestScores = decoded
        }
    }

    func record(category: FlashCategory, score: Int) {
        if score > (bestScores[category.rawValue] ?? 0) {
            bestScores[category.rawValue] = score
            if let data = try? JSONEncoder().encode(bestScores) {
                UserDefaults.standard.set(data, forKey: storageKey)
            }
        }
    }

    func best(for category: FlashCategory) -> Int { bestScores[category.rawValue] ?? 0 }
}
