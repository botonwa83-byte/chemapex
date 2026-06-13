import Foundation

// MARK: - 虚拟实验台：气体制备装置链拼装
// 一关 = 一种目标气体 + 装置插槽链（发生→除杂→干燥→收集→尾气）+ 仪器卡池。
// 选错卡片即时给出化学理由——错误本身就是考点。

struct ApparatusCard: Codable, Identifiable {
    let id: String
    let name: String       // 如 "饱和食盐水洗气"
    let detail: String     // 卡面小字，如 "除去混入的 HCl"
    let icon: String       // SF Symbol
}

struct LabSlot: Codable, Identifiable {
    let id: String
    let role: String           // 环节名：发生装置 / 除杂 / 干燥 / 收集 / 尾气处理
    let correctCardId: String
    let successNote: String    // 选对后的考点讲解
}

struct LabSetup: Codable, Identifiable {
    let id: String
    let title: String          // 如 "制取干燥的氯气"
    let stage: Stage
    let targetDescription: String   // 任务说明
    let slots: [LabSlot]
    let pool: [ApparatusCard]       // 正确卡 + 干扰卡（乱序展示）
    /// 干扰卡被选时的化学理由（cardId -> 为什么不行）
    let rejections: [String: String]
    let examPoint: String           // 通关总结
}

// MARK: - 实验台战绩

final class LabBenchManager: ObservableObject {
    static let shared = LabBenchManager()
    private let storageKey = "labbench_stars_v1"

    /// setupId -> 最佳星级 1...3
    @Published private(set) var bestStars: [String: Int] = [:]

    private init() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([String: Int].self, from: data) {
            bestStars = decoded
        }
    }

    func record(setupId: String, stars: Int) {
        if stars > (bestStars[setupId] ?? 0) {
            bestStars[setupId] = stars
            if let data = try? JSONEncoder().encode(bestStars) {
                UserDefaults.standard.set(data, forKey: storageKey)
            }
        }
    }

    var completedCount: Int { bestStars.count }

    /// 计星：零失误 3 星，1~2 次失误 2 星，更多 1 星。
    static func stars(mistakes: Int) -> Int {
        mistakes == 0 ? 3 : (mistakes <= 2 ? 2 : 1)
    }
}
