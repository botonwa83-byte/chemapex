import SwiftUI

// MARK: - 启动广告页（开头首页）：品牌 → 卖点 → 数据 → 开发者 → 版权 → 进入
// 设计参考 PhysicsApex / MathApex PromoView。每次启动先展示，点击进入主界面。

struct PromoView: View {
    var onEnter: () -> Void

    @State private var appeared = false
    @State private var glow = false

    private let features: [(icon: String, color: Color, title: String, desc: String)] = [
        ("bolt.fill", .apexLava, "守恒之眼 · 降维秒杀", "每道压轴题给你一招「上帝视角」秒杀解，常规解与守恒秒杀双解对照"),
        ("tablecells.fill", .apexStarBlue, "元素星图", "可交互周期表，考点热度着色，随登顶进度逐格点亮"),
        ("magnifyingglass", .apexMystery, "化学神探", "推断题做成逐条揭线索的破案游戏，练「识局」的元能力"),
        ("book.fill", .apexEmerald, "方程式剧本库", "方程式=条件+现象+考点+陷阱，少量/过量、浓/稀全标注"),
        ("brain.head.profile", .apexGold, "错题本 + 智能复习", "艾宾浩斯间隔重复，答错自动收录、按曲线安排复盘"),
    ]

    private var bg: some View {
        LinearGradient(colors: [Color(UIColor(hex6: 0x140F0A)),
                                Color(UIColor(hex6: 0x2A1A10)),
                                Color(UIColor(hex6: 0x140F0A))],
                       startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }

    var body: some View {
        ZStack {
            bg

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // Logo + 品牌
                    VStack(spacing: 14) {
                        ZStack {
                            Circle()
                                .fill(LinearGradient(colors: [.apexGold, .apexLava], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 96, height: 96)
                                .shadow(color: Color.apexLava.opacity(glow ? 0.7 : 0.3), radius: glow ? 26 : 12)
                            Image(systemName: "flask.fill").font(.system(size: 44, weight: .bold)).foregroundColor(.white)
                        }
                        Text("CHEM APEX")
                            .font(.system(size: 30, weight: .heavy, design: .rounded)).tracking(2)
                            .foregroundStyle(LinearGradient(colors: [.apexGold, .apexLava], startPoint: .leading, endPoint: .trailing))
                        Text("化 学 登 顶 · 守 恒 秒 杀")
                            .font(.system(size: 14, weight: .medium)).tracking(2).foregroundColor(.white.opacity(0.6))
                    }
                    .padding(.top, 48)

                    // 超能力 Hero
                    VStack(spacing: 10) {
                        Text("装上 ChemApex，解锁「守恒秒杀」超能力")
                            .font(.system(size: 18, weight: .bold)).multilineTextAlignment(.center).foregroundColor(.white)
                        Text("从初中的瓶瓶罐罐，到高考的守恒推断\n看见反应背后的棋局，一招降维就能秒")
                            .font(.system(size: 13)).multilineTextAlignment(.center).foregroundColor(.white.opacity(0.6)).lineSpacing(4)
                    }
                    .padding(.top, 28).padding(.horizontal, 24)

                    // 卖点卡片
                    VStack(spacing: 12) {
                        ForEach(Array(features.enumerated()), id: \.offset) { _, f in
                            HStack(spacing: 14) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12).fill(f.color.opacity(0.20)).frame(width: 46, height: 46)
                                    Image(systemName: f.icon).font(.system(size: 20, weight: .semibold)).foregroundColor(f.color)
                                }
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(f.title).font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                                    Text(f.desc).font(.system(size: 13)).foregroundColor(.white.opacity(0.65)).lineSpacing(2).fixedSize(horizontal: false, vertical: true)
                                }
                                Spacer(minLength: 0)
                            }
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.06)))
                        }
                    }
                    .padding(.top, 28).padding(.horizontal, 24)

                    // 数据统计
                    HStack(spacing: 0) {
                        stat("\(MainLineData.nodes.count)", "登顶关卡")
                        statDivider
                        stat("\(DescentCases.all.count)", "守恒战例")
                        statDivider
                        stat("\(WeaponGuideData.all.count)", "降维武器")
                    }
                    .padding(.vertical, 18).padding(.horizontal, 24)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.05)))
                    .padding(.top, 24).padding(.horizontal, 24)

                    // 开发者区
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 12) {
                            ZStack {
                                Circle().fill(LinearGradient(colors: [.apexGold, .apexLava], startPoint: .top, endPoint: .bottom)).frame(width: 44, height: 44)
                                Text("K").font(.system(size: 22, weight: .heavy)).foregroundColor(.white)
                            }
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Top King").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                                Text("独立开发者 / 教育科技探索者").font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
                            }
                            Spacer()
                        }
                        Text("专注教育类 App，用科技让学习更高效。ChemApex 把化学家的「识局之眼」带进高考——守恒、差量、极值、关系式，让每道压轴题都有一招可秒杀，也让化学重新变得好玩。")
                            .font(.system(size: 13)).foregroundColor(.white.opacity(0.65)).lineSpacing(3)
                    }
                    .padding(16)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.06)))
                    .padding(.top, 24).padding(.horizontal, 24)

                    // 版权
                    VStack(spacing: 4) {
                        Text("ChemApex · 化学登顶  v1.0.0").font(.system(size: 12)).foregroundColor(.white.opacity(0.5))
                        Text("© 2026 Top King. All rights reserved.").font(.system(size: 11)).foregroundColor(.white.opacity(0.35))
                    }
                    .padding(.top, 22).padding(.bottom, 120)
                }
                .frame(maxWidth: 600).frame(maxWidth: .infinity)
                .opacity(appeared ? 1 : 0).offset(y: appeared ? 0 : 24)
            }

            // 底部固定进入按钮
            VStack {
                Spacer()
                Button(action: onEnter) {
                    HStack(spacing: 8) {
                        Text("开 启 化 学 登 顶 之 旅").fontWeight(.bold).tracking(1)
                        Image(systemName: "arrow.right")
                    }
                    .font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    .frame(maxWidth: .infinity).padding(.vertical, 16)
                    .background(LinearGradient(colors: [.apexLava, .apexGold], startPoint: .leading, endPoint: .trailing),
                                in: RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.apexLava.opacity(0.45), radius: 14, y: 4)
                }
                .frame(maxWidth: 600 - 48).padding(.horizontal, 24).padding(.bottom, 20)
                .background(
                    LinearGradient(colors: [Color(UIColor(hex6: 0x140F0A)).opacity(0), Color(UIColor(hex6: 0x140F0A))], startPoint: .top, endPoint: .bottom)
                        .frame(height: 120).allowsHitTesting(false), alignment: .bottom
                )
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.7)) { appeared = true }
            withAnimation(.easeInOut(duration: 1.6).repeatForever(autoreverses: true)) { glow = true }
        }
    }

    private func stat(_ n: String, _ label: String) -> some View {
        VStack(spacing: 4) {
            Text(n).font(.system(size: 24, weight: .heavy, design: .rounded)).foregroundColor(.apexGold)
            Text(label).font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
    }

    private var statDivider: some View {
        Rectangle().fill(Color.white.opacity(0.2)).frame(width: 1, height: 30)
    }
}
