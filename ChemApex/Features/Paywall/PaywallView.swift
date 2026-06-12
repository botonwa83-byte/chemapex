import SwiftUI

// MARK: - 完整功能解锁付费墙（移植自 PhysicsApex）

struct PaywallView: View {
    @ObservedObject private var purchase = PurchaseManager.shared
    @Environment(\.dismiss) private var dismiss

    private var priceLabel: String { purchase.product?.displayPrice ?? "¥22" }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                heroArea

                VStack(alignment: .leading, spacing: 14) {
                    benefitRow(icon: "map.fill", color: .apexLava,
                               title: "解锁登顶之路全部 \(MainLineData.nodes.count) 关",
                               desc: "初中现象 → 高考守恒 → 竞赛结构，一条主线爬到山顶")
                    benefitRow(icon: "eye.fill", color: .apexMystery,
                               title: "解锁全部 \(DescentCases.all.count) 道守恒之眼战例",
                               desc: "常规解 vs 守恒秒杀，极值法、关系式法压轴武器全开")
                    benefitRow(icon: "magnifyingglass", color: .apexStarBlue,
                               title: "解锁化学神探全部 \(DetectiveData.all.count) 案",
                               desc: "推断题破案游戏，无机八案 + 有机两案逐条揭线索")
                    benefitRow(icon: "books.vertical.fill", color: .apexEmerald,
                               title: "解锁全部 \(ProblemBank.all.count) 道分层题库",
                               desc: "电化学、有机、实验、结构——高考全主干章节覆盖")
                    benefitRow(icon: "infinity", color: .apexGold,
                               title: "一次买断，永久使用",
                               desc: "无订阅、无续费，内容持续更新")
                    benefitRow(icon: "checkmark.shield.fill", color: .apexGold,
                               title: "支持恢复购买",
                               desc: "换机后登录同一 App Store 账号即可恢复")
                }
                .padding(.horizontal, 24).padding(.top, 28).padding(.bottom, 20)

                Divider().padding(.horizontal, 24)

                VStack(spacing: 6) {
                    Text("免费已开放：主线前 \(PurchaseManager.freeNodeCount) 关（含 \(PurchaseManager.freeDescentCount) 个 Boss）+ 神探前 \(PurchaseManager.freeDetectiveCount) 案；元素星图 / 方程式剧本 / 现象闪卡永久免费")
                        .font(.footnote).foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    Text("解锁后立即获得剩余全部内容 →")
                        .font(.footnote).fontWeight(.medium).foregroundColor(.apexLava)
                }
                .padding(.vertical, 16).padding(.horizontal, 24)

                purchaseButton.padding(.horizontal, 24)

                Button { Task { await purchase.restore() } } label: {
                    Text("恢复购买").font(.footnote).foregroundColor(.secondary).underline()
                }
                .padding(.top, 12).disabled(purchase.isPurchasing)

                if let err = purchase.errorMessage {
                    Text(err).font(.caption).foregroundColor(.apexDanger)
                        .multilineTextAlignment(.center).padding(.horizontal, 24).padding(.top, 8)
                }

                #if DEBUG
                Button("（调试）本地解锁") { purchase.debugToggle() }
                    .font(.caption2).foregroundColor(.secondary).padding(.top, 10)
                #endif

                Text("购买即视为同意《用户协议》。付款通过 Apple 账户完成，换机后可在「恢复购买」找回。")
                    .font(.system(size: 10)).foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 28).padding(.top, 16).padding(.bottom, 32)
            }
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .onChange(of: purchase.isUnlocked) { unlocked in
            if unlocked { dismiss() }
        }
    }

    private var heroArea: some View {
        ZStack {
            LinearGradient(colors: [Color.apexLava, Color.apexMystery],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(spacing: 10) {
                Image(systemName: "flask.fill").font(.system(size: 44)).foregroundColor(.white)
                Text("解锁完整版").font(.system(size: 24, weight: .black, design: .rounded)).foregroundColor(.white)
                Text("一杯奶茶钱，守恒秒杀随便用").font(.subheadline).foregroundColor(.white.opacity(0.9))
            }
            .padding(.vertical, 40)
        }
    }

    private var purchaseButton: some View {
        Button { Task { await purchase.purchase() } } label: {
            HStack(spacing: 10) {
                if purchase.isPurchasing { ProgressView().tint(.white) }
                else { Image(systemName: "lock.open.fill") }
                Text(purchase.isPurchasing ? "处理中…" : "立即解锁  \(priceLabel)").fontWeight(.bold)
            }
            .font(.headline).foregroundColor(.white)
            .frame(maxWidth: .infinity).padding(.vertical, 16)
            .background(LinearGradient(colors: [.apexLava, .apexMystery], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(16)
            .shadow(color: Color.apexLava.opacity(0.3), radius: 10, y: 4)
        }
        .disabled(purchase.isPurchasing)
    }

    private func benefitRow(icon: String, color: Color, title: String, desc: String) -> some View {
        HStack(alignment: .top, spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.15)).frame(width: 38, height: 38)
                Image(systemName: icon).font(.subheadline).foregroundColor(color)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.subheadline).fontWeight(.semibold).foregroundColor(.primary)
                Text(desc).font(.caption).foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}
