import SwiftUI

// MARK: - 学情诊断：告诉你哪章最弱、该攻哪里（解决「盲目刷题」）

struct DiagnosisView: View {
    @EnvironmentObject var progress: ProgressManager

    private var diagnosis: [ProgressManager.NodeDiagnosis] { progress.diagnosis() }

    var body: some View {
        Group {
            if diagnosis.isEmpty {
                ContentUnavailableViewCompat(
                    title: "还没有学情数据",
                    systemImage: "chart.bar.xaxis",
                    description: "做几道题之后，这里会按章节算出你的正确率，标出最该攻的薄弱点。"
                )
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.lg) {
                        overallCard
                        weakHighlight
                        SectionHeader(title: "各章正确率（弱在前）", systemImage: "list.bullet", accent: .apexStarBlue)
                        ForEach(diagnosis) { d in
                            chapterRow(d)
                        }
                    }
                    .padding(Spacing.lg)
                }
                .background(Color.apexBackground.ignoresSafeArea())
            }
        }
        .navigationTitle("学情诊断")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var overallCard: some View {
        HStack(spacing: Spacing.lg) {
            VStack(spacing: 2) {
                Text("\(Int(progress.overallAccuracy * 100))%")
                    .font(AppFont.bigStat(30)).foregroundColor(accColor(progress.overallAccuracy))
                Text("总正确率").font(.caption2).foregroundColor(.secondary)
            }
            Divider().frame(height: 40)
            VStack(spacing: 2) {
                Text("\(progress.totalAttempts)").font(AppFont.bigStat(30)).foregroundColor(.apexStarBlue)
                Text("累计答题").font(.caption2).foregroundColor(.secondary)
            }
            Divider().frame(height: 40)
            VStack(spacing: 2) {
                Text("\(diagnosis.count)").font(AppFont.bigStat(30)).foregroundColor(.apexEmerald)
                Text("已练章节").font(.caption2).foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .cardSurface(padding: Spacing.lg)
    }

    @ViewBuilder
    private var weakHighlight: some View {
        let weak = progress.weakNodes(limit: 3)
        if !weak.isEmpty {
            VStack(alignment: .leading, spacing: Spacing.md) {
                HStack {
                    Image(systemName: "target").foregroundColor(.apexDanger)
                    Text("优先攻克 · 你最弱的 \(weak.count) 章").font(AppFont.cardTitle)
                }
                ForEach(weak) { d in
                    NavigationLink {
                        TopicProblemListView(topic: d.node.topic)
                    } label: {
                        HStack {
                            Text(d.node.title).font(.subheadline).foregroundColor(.primary)
                            Spacer()
                            Text("\(Int(d.accuracy * 100))%").font(AppFont.chip).foregroundColor(.apexDanger)
                            Text("去练").font(AppFont.chip).foregroundColor(.apexLava)
                            Image(systemName: "chevron.right").font(.caption2).foregroundColor(.secondary)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Spacing.lg)
            .background(Color.apexDanger.opacity(0.08))
            .cornerRadius(Radius.card)
        }
    }

    private func chapterRow(_ d: ProgressManager.NodeDiagnosis) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(d.node.title).font(.subheadline).lineLimit(1)
                Spacer()
                Text("\(d.correct)/\(d.attempted)").font(.caption2).foregroundColor(.secondary)
                Text("\(Int(d.accuracy * 100))%").font(AppFont.chip).foregroundColor(accColor(d.accuracy))
                    .frame(width: 40, alignment: .trailing)
            }
            ProgressView(value: d.accuracy).tint(accColor(d.accuracy))
        }
        .cardSurface(padding: Spacing.md)
    }

    private func accColor(_ a: Double) -> Color {
        a >= 0.8 ? .apexEmerald : (a >= 0.6 ? .apexGold : .apexDanger)
    }
}
