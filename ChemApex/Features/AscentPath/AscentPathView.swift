import SwiftUI

// MARK: - 首页 · 指挥中心
// 改造后定位：先亮出武器（方法），再展示训练轨道。
// 顶部「今日实战」是灵魂模块入口（主打武器/守恒之眼/化学神探），
// 下方「登顶之路」是可自由进出的系统训练轨道（不再锁死）。

struct AscentPathView: View {
    @EnvironmentObject var profile: StudentProfile
    @EnvironmentObject var progress: ProgressManager
    @ObservedObject private var purchase = PurchaseManager.shared
    @State private var showPaywall = false

    private var nodes: [LearningNode] { MainLineData.nodes }
    private var recommended: LearningNode? { progress.currentNode(in: nodes) }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Spacing.lg) {
                    premiumBanner
                    examCountdown
                    weakRecommend
                    todayBattle
                    statusHeader
                    pathHeader

                    ForEach(Array(nodes.enumerated()), id: \.element.id) { index, node in
                        if index == 0 || node.stage != nodes[index - 1].stage {
                            stageDivider(node.stage)
                        }
                        NodeCard(node: node,
                                 state: progress.nodeState(node, in: nodes),
                                 progressValue: progress.nodeProgress(node),
                                 isRecommended: node.id == recommended?.id,
                                 premiumLocked: purchase.isNodePremiumLocked(node),
                                 onPremiumTap: { showPaywall = true })
                    }

                    summitBanner
                }
                .padding(.horizontal, Spacing.lg)
                .padding(.bottom, Spacing.xxl)
                .readableWidth()
            }
            .background(Color.apexBackground.ignoresSafeArea())
            .navigationTitle("指挥中心")
            .sheet(isPresented: $showPaywall) { PaywallView() }
        }
    }

    // MARK: 解锁完整版（首页置顶钩子）

    @ViewBuilder
    private var premiumBanner: some View {
        if !purchase.isUnlocked {
            Button { showPaywall = true } label: {
                HStack(spacing: Spacing.md) {
                    Image(systemName: "crown.fill")
                        .font(.title3).foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(Color.white.opacity(0.18))
                        .clipShape(RoundedRectangle(cornerRadius: Radius.inner))
                    VStack(alignment: .leading, spacing: 2) {
                        Text("解锁完整版").font(AppFont.cardTitle).foregroundColor(.white)
                        Text("全部 \(nodes.count) 关 · 守恒之眼 · 化学神探 · \(WeaponGuideData.all.count) 把武器，一次买断")
                            .font(.caption2).foregroundColor(.white.opacity(0.9)).lineLimit(2)
                    }
                    Spacer(minLength: 0)
                    Text(purchase.product?.displayPrice ?? "¥22")
                        .font(AppFont.cardTitle).foregroundColor(.white)
                        .padding(.horizontal, 12).padding(.vertical, 6)
                        .background(Color.white.opacity(0.22)).clipShape(Capsule())
                }
                .padding(Spacing.lg)
                .background(LinearGradient(colors: [.apexGold, .apexLava], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(Radius.card)
                .shadow(color: Color.apexLava.opacity(0.3), radius: 8, y: 4)
            }
            .buttonStyle(.plain)
        }
    }

    // MARK: 距高考倒计时

    @ViewBuilder
    private var examCountdown: some View {
        if let days = profile.daysToExam {
            HStack(spacing: Spacing.md) {
                Image(systemName: "flag.checkered").font(.title3).foregroundColor(.apexLava)
                VStack(alignment: .leading, spacing: 1) {
                    Text("距高考").font(.caption2).foregroundColor(.secondary)
                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text("\(days)").font(AppFont.bigStat(28)).foregroundColor(.apexLava)
                        Text("天").font(.caption).foregroundColor(.secondary)
                    }
                }
                Spacer()
                Text("每多掌握一把武器，就多拿几分").font(.caption2).foregroundColor(.secondary)
                    .multilineTextAlignment(.trailing).frame(width: 120)
            }
            .cardSurface(padding: Spacing.lg)
        }
    }

    // MARK: 薄弱推荐（学情诊断上首页）

    @ViewBuilder
    private var weakRecommend: some View {
        let weak = progress.weakNodes(limit: 1)
        if let d = weak.first {
            NavigationLink {
                DiagnosisView()
            } label: {
                HStack(spacing: Spacing.md) {
                    Image(systemName: "target").font(.title3)
                        .frame(width: 44, height: 44)
                        .background(Color.apexDanger.opacity(0.12))
                        .foregroundColor(.apexDanger)
                        .cornerRadius(Radius.inner)
                    VStack(alignment: .leading, spacing: 3) {
                        Text("学情诊断 · 优先攻弱项").font(.caption2).foregroundColor(.secondary)
                        Text("最弱：\(d.node.title)").font(AppFont.cardTitle)
                        Text("正确率仅 \(Int(d.accuracy * 100))%，先把它补起来").font(.caption).foregroundColor(.apexDanger)
                    }
                    Spacer(minLength: 0)
                    Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
                }
                .foregroundColor(.primary)
                .cardSurface(padding: Spacing.lg)
            }
            .buttonStyle(.plain)
        }
    }

    // MARK: 今日实战（灵魂模块入口）

    private var todayBattle: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            SectionHeader(title: "今日实战", systemImage: "bolt.fill", accent: .apexLava)

            if let guide = dailyWeapon {
                NavigationLink { WeaponDetailView(guide: guide) } label: {
                    featuredCard(
                        icon: guide.weapon.icon, accent: guide.weapon.stage.color,
                        kicker: "本周主打武器",
                        title: guide.weapon.name,
                        subtitle: guide.tagline,
                        badge: "学方法")
                }
                .buttonStyle(.plain)
            }

            if let boss = dailyDuel, let dual = boss.dualSolution {
                NavigationLink { DescentDetailView(problem: boss, dual: dual) } label: {
                    featuredCard(
                        icon: "eye", accent: .apexMystery,
                        kicker: "守恒之眼 · 今日对决",
                        title: dual.weapon.name,
                        subtitle: "常规解 \(timeText(dual.standard.timeMinutes)) → 秒杀 \(timeText(dual.descent.timeMinutes))",
                        badge: String(format: "快 %.0f 倍", dual.timeRatio))
                }
                .buttonStyle(.plain)
            }

            if let kase = dailyCase {
                NavigationLink { DetectiveCaseView(detectiveCase: kase) } label: {
                    featuredCard(
                        icon: "magnifyingglass", accent: .apexStarBlue,
                        kicker: "化学神探 · 今日悬案",
                        title: kase.title,
                        subtitle: "\(kase.clues.count) 条线索，越早破案星越高",
                        badge: "破案")
                }
                .buttonStyle(.plain)
            }
        }
    }

    private func featuredCard(icon: String, accent: Color, kicker: String,
                              title: String, subtitle: String, badge: String) -> some View {
        HStack(spacing: Spacing.lg) {
            Image(systemName: icon)
                .font(.title2)
                .frame(width: 48, height: 48)
                .background(accent.opacity(0.15))
                .foregroundColor(accent)
                .cornerRadius(Radius.inner)
            VStack(alignment: .leading, spacing: 3) {
                Text(kicker).font(.caption2).foregroundColor(.secondary)
                Text(title).font(AppFont.cardTitle).foregroundColor(.primary)
                Text(subtitle).font(.caption).foregroundColor(accent).lineLimit(2)
            }
            Spacer(minLength: 0)
            TagChip(text: badge, color: accent)
        }
        .cardSurface(padding: Spacing.lg)
    }

    // MARK: 今日状态

    private var statusHeader: some View {
        HStack(spacing: Spacing.lg) {
            statBlock(value: "\(progress.completedNodeCount)/\(nodes.count)", label: "主线进度", color: .apexLava)
            statBlock(value: "\(progress.streak)", label: "连续天数 🔥", color: .apexGold)
            statBlock(value: "\(WeaponGuideData.all.count)", label: "解题武器", color: .apexEmerald)
        }
        .cardSurface(padding: Spacing.lg)
    }

    private func statBlock(value: String, label: String, color: Color) -> some View {
        VStack(spacing: 2) {
            Text(value).font(AppFont.bigStat(24)).foregroundColor(color)
            Text(label).font(.caption2).foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }

    private var pathHeader: some View {
        HStack(spacing: 6) {
            Image(systemName: "map").foregroundColor(.apexLava)
            Text("登顶之路 · 系统训练").font(AppFont.sectionTitle)
            Spacer()
            if let rec = recommended {
                Text("推荐：\(rec.title)").font(.caption2).foregroundColor(.secondary).lineLimit(1)
            }
        }
        .padding(.top, Spacing.sm)
    }

    private var summitBanner: some View {
        VStack(spacing: Spacing.xs) {
            Text("🏔").font(.system(size: 44))
            Text("APEX · 化学之巅").font(AppFont.cardTitle).foregroundColor(.apexMystery)
        }
        .padding(.top, Spacing.sm)
    }

    private func stageDivider(_ stage: Stage) -> some View {
        HStack(spacing: Spacing.sm) {
            Rectangle().fill(stage.color.opacity(0.4)).frame(height: 1)
            Text("\(stage.emoji) \(stage.title)")
                .font(AppFont.chip).foregroundColor(stage.color)
                .fixedSize()
            Rectangle().fill(stage.color.opacity(0.4)).frame(height: 1)
        }
        .padding(.vertical, Spacing.xs)
    }

    // MARK: 每日轮换（按一年中的第几天，稳定到天）

    private var dayOfYear: Int {
        Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 1
    }
    private var dailyWeapon: WeaponGuide? {
        let g = WeaponGuideData.all
        return g.isEmpty ? nil : g[dayOfYear % g.count]
    }
    private var dailyDuel: ChemProblem? {
        let d = DescentCases.all
        return d.isEmpty ? nil : d[dayOfYear % d.count]
    }
    private var dailyCase: DetectiveCase? {
        let c = DetectiveData.all
        return c.isEmpty ? nil : c[dayOfYear % c.count]
    }
    private func timeText(_ min: Double) -> String {
        min < 1 ? "\(Int(min * 60)) 秒" : String(format: "%.0f 分", min)
    }
}

// MARK: - 主线节点卡片

struct NodeCard: View {
    let node: LearningNode
    let state: NodeState
    let progressValue: Double
    var isRecommended: Bool = false
    var premiumLocked: Bool = false
    var onPremiumTap: () -> Void = {}

    var body: some View {
        Group {
            if premiumLocked {
                Button(action: onPremiumTap) { cardLabel }
            } else {
                NavigationLink { NodeDetailView(node: node) } label: { cardLabel }
            }
        }
        .buttonStyle(.plain)
    }

    private var cardLabel: some View {
        HStack(spacing: Spacing.lg) {
            // 序号圆环
            ZStack {
                Circle()
                    .stroke(node.stage.color, lineWidth: 3)
                    .frame(width: 46, height: 46)
                if premiumLocked {
                    Image(systemName: "crown.fill").font(.subheadline).foregroundColor(.apexGold)
                } else if state == .completed {
                    Image(systemName: "checkmark").font(.headline).foregroundColor(node.stage.color)
                } else {
                    Text("\(node.order)").font(AppFont.bigStat(18)).foregroundColor(node.stage.color)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(node.title)
                    .font(AppFont.cardTitle)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                Text(node.tagline)
                    .font(.caption).foregroundColor(.secondary)
                    .lineLimit(1)
                HStack(spacing: 6) {
                    TagChip(text: "\(node.knowledgePoints.count) 个知识点", color: .apexStarBlue)
                    if node.bossCaseId != nil {
                        TagChip(text: "⚔️ Boss", color: .apexMystery)
                    }
                    if isRecommended {
                        TagChip(text: "推荐", color: .apexLava)
                    }
                }
            }
            Spacer(minLength: 0)

            if progressValue > 0 && state != .completed {
                VStack(spacing: 2) {
                    Text("\(Int(progressValue * 100))%")
                        .font(AppFont.chip).foregroundColor(node.stage.color)
                    ProgressView(value: progressValue)
                        .frame(width: 36)
                        .tint(node.stage.color)
                }
            }
        }
        .cardSurface(padding: Spacing.lg)
        .overlay(
            RoundedRectangle(cornerRadius: Radius.card)
                .stroke(isRecommended && !premiumLocked ? node.stage.color : .clear, lineWidth: 2)
        )
        .opacity(premiumLocked ? 0.7 : 1)
    }
}
