import SwiftUI

// MARK: - 守恒之眼：双解对决战例列表

struct DescentView: View {
    @EnvironmentObject var progress: ProgressManager
    @ObservedObject private var purchase = PurchaseManager.shared
    @State private var showPaywall = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("同一道题，两种命运：常规硬解 vs 守恒秒杀。\n看见差距，才会想要武器。")
                    .font(.subheadline).foregroundColor(.secondary)
                    .padding(.bottom, Spacing.xs)

                ForEach(Array(DescentCases.all.enumerated()), id: \.element.id) { index, p in
                    if let dual = p.dualSolution {
                        if purchase.isDescentPremiumLocked(index: index) {
                            Button { showPaywall = true } label: { caseLabel(p, dual: dual, locked: true) }
                                .buttonStyle(.plain)
                        } else {
                            caseCard(p, dual: dual)
                        }
                    }
                }
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.mysteryBackground.ignoresSafeArea())
        .navigationTitle("守恒之眼")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showPaywall) { PaywallView() }
    }

    private func caseCard(_ p: ChemProblem, dual: DualSolution) -> some View {
        NavigationLink {
            DescentDetailView(problem: p, dual: dual)
        } label: {
            caseLabel(p, dual: dual, locked: false)
        }
        .buttonStyle(.plain)
    }

    private func caseLabel(_ p: ChemProblem, dual: DualSolution, locked: Bool) -> some View {
            VStack(alignment: .leading, spacing: Spacing.sm) {
                HStack {
                    Image(systemName: dual.weapon.icon).foregroundColor(.apexMystery)
                    Text(dual.weapon.name).font(AppFont.cardTitle)
                    Spacer()
                    TagChip(text: String(format: "快 %.0f 倍", dual.timeRatio), color: .apexMystery)
                    if locked {
                        Image(systemName: "crown.fill").foregroundColor(.apexGold)
                    } else if progress.viewedBossCases.contains(p.id) {
                        Image(systemName: "checkmark.seal.fill").foregroundColor(.apexGold)
                    }
                }
                Text(p.content).font(.subheadline).foregroundColor(.secondary).lineLimit(3)
                HStack(spacing: 6) {
                    TagChip(text: p.stage.shortTitle, color: p.stage.color)
                    TagChip(text: p.topic.name, color: .apexStarBlue)
                    if locked { TagChip(text: "完整版解锁", color: .apexGold) }
                }
            }
            .foregroundColor(.primary)
            .cardSurface(padding: Spacing.lg)
            .opacity(locked ? 0.7 : 1)
    }
}

// MARK: - 双解对决详情

struct DescentDetailView: View {
    let problem: ChemProblem
    let dual: DualSolution
    @EnvironmentObject var progress: ProgressManager

    @State private var showStandard = false
    @State private var showDescent = false
    @State private var showPlainTalk = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                // 题面
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    HStack(spacing: 6) {
                        TagChip(text: problem.stage.shortTitle, color: problem.stage.color)
                        TagChip(text: problem.topic.name, color: .apexStarBlue)
                    }
                    Text(problem.content).font(.body)
                }
                .cardSurface(padding: Spacing.lg)

                // 耗时对比条
                timeBar

                // 常规解
                solutionCard(
                    path: dual.standard, accent: .apexStarBlue,
                    icon: "tortoise", expanded: $showStandard)

                // 降维解
                solutionCard(
                    path: dual.descent, accent: .apexMystery,
                    icon: "hare", expanded: $showDescent)

                // 为什么能这么秒 · 原理（核心教学，讲透所以然）
                if !dual.principle.isEmpty {
                    VStack(alignment: .leading, spacing: Spacing.sm) {
                        HStack {
                            Image(systemName: "lightbulb.max.fill").foregroundColor(.apexEmerald)
                            Text("为什么能这么秒 · 原理").font(AppFont.cardTitle)
                        }
                        Text(dual.principle).font(.subheadline).lineSpacing(4)
                            .foregroundColor(.primary.opacity(0.9))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(Spacing.lg)
                    .background(Color.apexEmerald.opacity(0.1))
                    .cornerRadius(Radius.card)
                }

                // 武器洞察
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    HStack {
                        Image(systemName: dual.weapon.icon).foregroundColor(.apexGold)
                        Text("一句话记住 · \(dual.weapon.name)").font(AppFont.cardTitle)
                    }
                    Text(dual.keyInsight).font(.subheadline)
                }
                .cardSurface(padding: Spacing.lg)

                // 说人话
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    Button {
                        withAnimation { showPlainTalk.toggle() }
                    } label: {
                        HStack {
                            Text("🗣 说人话").font(AppFont.cardTitle)
                            Spacer()
                            Image(systemName: showPlainTalk ? "chevron.up" : "chevron.down")
                                .font(.caption)
                        }
                        .foregroundColor(.primary)
                    }
                    .buttonStyle(.plain)
                    if showPlainTalk {
                        Text(dual.plainTalk).font(.subheadline).foregroundColor(.primary.opacity(0.85))
                    }
                }
                .padding(Spacing.lg)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.mysteryPaper)
                .cornerRadius(Radius.card)
                .cardShadow()
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.mysteryBackground.ignoresSafeArea())
        .navigationTitle("双解对决")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { progress.markBossViewed(problem.id) }
    }

    // MARK: 组件

    private var timeBar: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            SectionHeader(title: "耗时对决", systemImage: "stopwatch", accent: .apexMystery)
            barRow(label: "常规解", minutes: dual.standard.timeMinutes,
                   maxMinutes: dual.standard.timeMinutes, color: .apexStarBlue)
            barRow(label: "守恒之眼", minutes: dual.descent.timeMinutes,
                   maxMinutes: dual.standard.timeMinutes, color: .apexMystery)
            Text(String(format: "降维视角快 %.0f 倍", dual.timeRatio))
                .font(AppFont.chip).foregroundColor(.apexMystery)
        }
        .cardSurface(padding: Spacing.lg)
    }

    private func barRow(label: String, minutes: Double, maxMinutes: Double, color: Color) -> some View {
        HStack(spacing: Spacing.md) {
            Text(label).font(.caption).frame(width: 56, alignment: .leading)
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 4)
                    .fill(color)
                    .frame(width: max(geo.size.width * minutes / max(maxMinutes, 0.1), 8))
            }
            .frame(height: 12)
            Text(String(format: "%.1f 分", minutes))
                .font(AppFont.chip).foregroundColor(.secondary)
                .frame(width: 48, alignment: .trailing)
        }
    }

    private func solutionCard(path: SolutionPath, accent: Color, icon: String, expanded: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) { expanded.wrappedValue.toggle() }
            } label: {
                HStack {
                    Image(systemName: icon).foregroundColor(accent)
                    Text(path.title).font(AppFont.cardTitle).foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: expanded.wrappedValue ? "chevron.up" : "chevron.down")
                        .font(.caption).foregroundColor(.secondary)
                }
            }
            .buttonStyle(.plain)

            if expanded.wrappedValue {
                ForEach(path.steps.indices, id: \.self) { i in
                    HStack(alignment: .top, spacing: Spacing.sm) {
                        Text("\(i + 1)")
                            .font(AppFont.chip)
                            .frame(width: 18, height: 18)
                            .background(Circle().fill(accent.opacity(0.15)))
                            .foregroundColor(accent)
                        Text(path.steps[i]).font(.subheadline)
                    }
                }
            }
        }
        .cardSurface(padding: Spacing.lg)
    }
}
