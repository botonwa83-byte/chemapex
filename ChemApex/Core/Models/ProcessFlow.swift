import Foundation

// MARK: - 工艺流程题：工业流程 = 一条线性链（原料 → 操作 → 产物）
// 高考流程题几乎都是线性链 + 侧加试剂 / 侧出滤渣，不需要自由连线画布。
// 关键决策点（加什么试剂、为什么这个顺序）做成可点击填空，选对才揭示操作。

struct ProcessNode: Codable, Identifiable {
    let id: String
    let substance: String       // 物质框文字，如 "粗盐水"
    var highlight: Bool = false // 终产物高亮
}

struct ProcessQuiz: Codable {
    let prompt: String          // 填空提问，如 "这一步该加入什么？"
    let options: [String]
    let answerIndex: Int
    let explanation: String
}

struct ProcessStep: Codable, Identifiable {
    let id: String
    let operation: String       // 箭头上的操作（正确答案文字）
    let sideNote: String        // 操作的化学效果，选对后展开
    var quiz: ProcessQuiz? = nil // 有则该步操作先隐藏成填空
}

struct ProcessFlow: Codable, Identifiable {
    let id: String
    let title: String
    let stage: Stage
    let topic: ChemTopic
    let overview: String        // 任务说明（含原料杂质等）
    let nodes: [ProcessNode]    // n+1 个物质框
    let steps: [ProcessStep]    // n 个箭头，step[i] 连接 node[i]→node[i+1]
    let examPoint: String       // 通关总结

    /// 该流程的填空总数（计星用）。
    var quizCount: Int { steps.filter { $0.quiz != nil }.count }
}

// MARK: - 流程题战绩

final class ProcessFlowManager: ObservableObject {
    static let shared = ProcessFlowManager()
    private let storageKey = "processflow_stars_v1"

    /// flowId -> 最佳星级 1...3
    @Published private(set) var bestStars: [String: Int] = [:]

    private init() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([String: Int].self, from: data) {
            bestStars = decoded
        }
    }

    func record(flowId: String, stars: Int) {
        if stars > (bestStars[flowId] ?? 0) {
            bestStars[flowId] = stars
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
