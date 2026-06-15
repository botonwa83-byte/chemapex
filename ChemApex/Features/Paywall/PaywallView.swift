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
                    benefitRow(icon: "shield.lefthalf.filled", color: .apexLava,
                               title: "解锁全套 \(WeaponGuideData.all.count) 把降维武器",
                               desc: "电子守恒、差量、极值、关系式……每把都教「何时用·怎么用」，压轴题一行拿下")
                    benefitRow(icon: "eye.fill", color: .apexMystery,
                               title: "解锁全部守恒之眼对决",
                               desc: "同一道压轴题，常规解 8 分钟 vs 秒杀 30 秒——看见差距，学会秒杀")
                    benefitRow(icon: "bubble.left.and.text.bubble.right.fill", color: .apexEmerald,
                               title: "每道难题都「说人话」",
                               desc: "不只给答案，更讲「这一步你是怎么想到的」——是教练，不是答案册")
                    benefitRow(icon: "magnifyingglass", color: .apexStarBlue,
                               title: "解锁化学神探全部 \(DetectiveData.all.count) 案",
                               desc: "推断题做成破案游戏，练的是「识局」的元能力")
                    benefitRow(icon: "infinity", color: .apexGold,
                               title: "一次买断，永久使用",
                               desc: "无订阅、无续费，方法与内容持续更新；支持换机恢复购买")
                }
                .padding(.horizontal, 24).padding(.top, 28).padding(.bottom, 20)

                Divider().padding(.horizontal, 24)

                VStack(spacing: 6) {
                    Text("免费已开放：初中全部 + 高中前 3 核心关，含电子守恒等 \(PurchaseManager.freeDescentCount) 把武器的完整对决；元素星图 / 方程式剧本 / 现象闪卡永久免费")
                        .font(.footnote).foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    Text("先白嫖一把武器试试手感，再解锁全套 →")
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

                Text("购买即视为同意[用户协议](https://botonwa83-byte.github.io/chemapex/terms.html)与[隐私政策](https://botonwa83-byte.github.io/chemapex/privacy.html)。付款通过 Apple 账户完成，换机后可在「恢复购买」找回。")
                    .font(.system(size: 10)).foregroundColor(.secondary)
                    .tint(.apexLava)
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
                Image(systemName: "shield.lefthalf.filled").font(.system(size: 44)).foregroundColor(.white)
                Text("解锁全套解题武器").font(.system(size: 24, weight: .black, design: .rounded)).foregroundColor(.white)
                Text("不是多给你几道题，是教你怎么把题秒掉").font(.subheadline).foregroundColor(.white.opacity(0.9))
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
