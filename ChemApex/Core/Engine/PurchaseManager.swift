import StoreKit
import SwiftUI

// MARK: - 完整功能解锁 IAP（StoreKit 2 · 一次性买断，移植自 PhysicsApex）
//
// 产品 ID：com.chemapex.app.full_unlock（¥22 一次性买断，价格在 App Store Connect 配置）
// 免费档：主线前 6 关（初中全部 + 物质的量/离子反应/氧化还原，含 4 个守恒之眼 Boss）
//        + 化学神探前 3 案；元素星图 / 方程式剧本库 / 现象闪卡 / 智能复习 / 错题本 永久免费（习惯与转化钩子）。
// 解锁后：主线 15 关、守恒之眼 6 战例、神探 10 案与后续更新内容全开。
// 本地 UserDefaults 缓存即时呈现，启动时 Transaction.currentEntitlements 核验防破解。

final class PurchaseManager: ObservableObject {
    static let shared = PurchaseManager()

    let productID = "com.chemapex.app.full_unlock"

    /// 免费档数量。改动需同步 ChemApexTests.testFreeTierPolicy。
    static let freeNodeCount = 6        // 主线前 6 关
    static let freeDescentCount = 4     // 守恒之眼前 4 案（恰为免费关卡的 Boss）
    static let freeDetectiveCount = 3   // 化学神探前 3 案
    static let freeLabCount = 3         // 虚拟实验台前 3 关（初中全部）
    static let freeProcessCount = 2     // 工艺流程前 2 个

    @Published private(set) var isUnlocked: Bool = false
    @Published private(set) var product: Product?
    @Published private(set) var isPurchasing: Bool = false
    @Published private(set) var errorMessage: String?

    private let storageKey = "chemapex_full_unlocked"

    private init() {
        isUnlocked = UserDefaults.standard.bool(forKey: storageKey)
        Task {
            await loadProduct()
            await refreshEntitlements()
        }
    }

    // MARK: 免费档判定

    /// 主线节点是否需要付费解锁（与进度解锁无关，是另一把锁）。
    func isNodePremiumLocked(_ node: LearningNode) -> Bool {
        guard !isUnlocked else { return false }
        return node.order > Self.freeNodeCount
    }

    /// 题目是否被付费锁住：跟随其所属主线节点；无节点归属的题免费。
    func isProblemPremiumLocked(_ problem: ChemProblem) -> Bool {
        guard !isUnlocked else { return false }
        guard let nodeId = problem.nodeId, let node = MainLineData.node(id: nodeId) else { return false }
        return node.order > Self.freeNodeCount
    }

    func isDescentPremiumLocked(index: Int) -> Bool {
        guard !isUnlocked else { return false }
        return index >= Self.freeDescentCount
    }

    func isDetectivePremiumLocked(index: Int) -> Bool {
        guard !isUnlocked else { return false }
        return index >= Self.freeDetectiveCount
    }

    func isLabPremiumLocked(index: Int) -> Bool {
        guard !isUnlocked else { return false }
        return index >= Self.freeLabCount
    }

    func isProcessPremiumLocked(index: Int) -> Bool {
        guard !isUnlocked else { return false }
        return index >= Self.freeProcessCount
    }

    // MARK: StoreKit

    @MainActor
    func loadProduct() async {
        do {
            let products = try await Product.products(for: [productID])
            product = products.first
        } catch {
            // 沙盒未配置时静默失败，价格降级显示
        }
    }

    @MainActor
    func purchase() async {
        guard let product else {
            errorMessage = "获取产品信息失败，请检查网络后重试"
            return
        }
        isPurchasing = true
        errorMessage = nil
        defer { isPurchasing = false }
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                let transaction = try checkVerified(verification)
                await transaction.finish()
                unlock()
            case .userCancelled:
                break
            case .pending:
                errorMessage = "购买待处理（可能需要家长确认），完成后将自动解锁"
            @unknown default:
                break
            }
        } catch {
            errorMessage = "购买失败：\(error.localizedDescription)"
        }
    }

    @MainActor
    func restore() async {
        isPurchasing = true
        errorMessage = nil
        defer { isPurchasing = false }
        do {
            try await AppStore.sync()
            await refreshEntitlements()
            if !isUnlocked { errorMessage = "未找到购买记录" }
        } catch {
            errorMessage = "恢复失败：\(error.localizedDescription)"
        }
    }

    func refreshEntitlements() async {
        for await result in Transaction.currentEntitlements {
            if case .verified(let tx) = result,
               tx.productID == productID,
               tx.revocationDate == nil {
                await MainActor.run { unlock() }
                return
            }
        }
    }

    @MainActor
    private func unlock() {
        isUnlocked = true
        UserDefaults.standard.set(true, forKey: storageKey)
    }

    private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified(_, let error): throw error
        case .verified(let value): return value
        }
    }

    #if DEBUG
    /// 调试用：本地直接解锁 / 还原，便于无 ASC 时预览。
    @MainActor func debugToggle() {
        isUnlocked.toggle()
        UserDefaults.standard.set(isUnlocked, forKey: storageKey)
    }
    #endif
}
