import SwiftUI

// MARK: - 主线节点详情：学（知识点）→ 练（题目）→ 战（Boss）

struct NodeDetailView: View {
    let node: LearningNode
    @EnvironmentObject var progress: ProgressManager

    private var problems: [ChemProblem] { ProblemBank.problems(for: node) }
    private var bossCase: ChemProblem? {
        node.bossCaseId.flatMap { DescentCases.bossCase(id: $0) }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                header

                // 学
                SectionHeader(title: "学 · 知识点", systemImage: "book", accent: .apexStarBlue)
                ForEach(node.knowledgePoints) { kp in
                    KnowledgeCard(point: kp, accent: node.stage.color)
                }

                // 练
                SectionHeader(title: "练 · 关卡题目", systemImage: "pencil", accent: .apexEmerald)
                Text("答对 60% 即可通关，点亮下一节点")
                    .font(.caption).foregroundColor(.secondary)
                ForEach(problems) { p in
                    problemRow(p)
                }

                // 战
                if let boss = bossCase, let dual = boss.dualSolution {
                    SectionHeader(title: "战 · Boss 双解对决", systemImage: "eye", accent: .apexMystery)
                    NavigationLink {
                        DescentDetailView(problem: boss, dual: dual)
                    } label: {
                        bossCard(boss, dual: dual)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(Spacing.lg)
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("第 \(node.order) 关")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack {
                TagChip(text: "\(node.stage.emoji) \(node.stage.shortTitle)", color: node.stage.color)
                TagChip(text: node.topic.name, color: .apexStarBlue)
                Spacer()
                Text("\(Int(progress.nodeProgress(node) * 100))%")
                    .font(AppFont.bigStat(20)).foregroundColor(node.stage.color)
            }
            Text(node.title).font(.title2.bold())
            Text(node.tagline).font(.subheadline).foregroundColor(.secondary)
            ProgressView(value: progress.nodeProgress(node)).tint(node.stage.color)
        }
        .cardSurface(padding: Spacing.lg)
    }

    private func problemRow(_ p: ChemProblem) -> some View {
        let solved = progress.stats(for: p.id).everCorrect
        return NavigationLink {
            ProblemDetailView(problem: p)
        } label: {
            HStack(spacing: Spacing.md) {
                Image(systemName: solved ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(solved ? .apexEmerald : .secondary)
                Text(p.content)
                    .font(.subheadline).foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Spacer(minLength: 0)
                Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
            }
            .cardSurface(padding: Spacing.lg)
        }
        .buttonStyle(.plain)
    }

    private func bossCard(_ boss: ChemProblem, dual: DualSolution) -> some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack {
                Image(systemName: dual.weapon.icon).foregroundColor(.apexMystery)
                Text("武器：\(dual.weapon.name)").font(AppFont.cardTitle)
                Spacer()
                TagChip(text: String(format: "快 %.0f 倍", dual.timeRatio), color: .apexMystery)
                if progress.viewedBossCases.contains(boss.id) {
                    Image(systemName: "checkmark.seal.fill").foregroundColor(.apexGold)
                }
            }
            Text(boss.content).font(.subheadline).foregroundColor(.secondary).lineLimit(3)
            Text(dual.keyInsight).font(.caption).foregroundColor(.apexMystery)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.lg)
        .background(Color.mysteryBackground)
        .cornerRadius(Radius.card)
        .cardShadow()
    }
}

// MARK: - 知识点卡

struct KnowledgeCard: View {
    let point: KnowledgePoint
    var accent: Color = .apexLava
    @State private var expanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) { expanded.toggle() }
            } label: {
                HStack {
                    Circle().fill(accent).frame(width: 8, height: 8)
                    Text(point.title).font(AppFont.cardTitle).foregroundColor(.primary)
                    Spacer()
                    Image(systemName: expanded ? "chevron.up" : "chevron.down")
                        .font(.caption).foregroundColor(.secondary)
                }
            }
            .buttonStyle(.plain)

            if expanded {
                Text(point.detail).font(.subheadline).foregroundColor(.primary.opacity(0.85))
                if let pitfall = point.pitfall {
                    HStack(alignment: .top, spacing: 6) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.caption).foregroundColor(.apexDanger)
                        Text(pitfall).font(.caption).foregroundColor(.apexDanger)
                    }
                    .padding(Spacing.sm)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.apexDanger.opacity(0.08))
                    .cornerRadius(Radius.inner)
                }
            }
        }
        .cardSurface(padding: Spacing.lg)
    }
}
