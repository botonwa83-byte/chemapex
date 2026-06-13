import SwiftUI

// MARK: - 反应釜：分章自由刷题

struct LabView: View {
    @EnvironmentObject var progress: ProgressManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: Spacing.xl) {
                    benchEntry

                    ForEach(Stage.allCases) { stage in
                        SectionHeader(title: "\(stage.emoji) \(stage.title)", accent: stage.color)
                        ForEach(topics(for: stage)) { topic in
                            topicRow(topic, stage: stage)
                        }
                    }
                }
                .padding(Spacing.lg)
            }
            .background(Color.apexBackground.ignoresSafeArea())
            .navigationTitle("反应釜")
        }
    }

    private var benchEntry: some View {
        NavigationLink { LabBenchView() } label: {
            HStack(spacing: Spacing.lg) {
                Image(systemName: "flask.fill")
                    .font(.title2)
                    .frame(width: 48, height: 48)
                    .background(Color.apexEmerald.opacity(0.15))
                    .foregroundColor(.apexEmerald)
                    .cornerRadius(Radius.inner)
                VStack(alignment: .leading, spacing: 4) {
                    Text("虚拟实验台").font(AppFont.cardTitle)
                    Text("拼气体制备装置链 · \(LabBenchManager.shared.completedCount)/\(LabBenchData.all.count) 已通关")
                        .font(.caption).foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
            }
            .foregroundColor(.primary)
            .cardSurface(padding: Spacing.lg)
        }
        .buttonStyle(.plain)
    }

    private func topics(for stage: Stage) -> [ChemTopic] {
        ChemTopic.allCases.filter { $0.stage == stage && !ProblemBank.problems(topic: $0).isEmpty }
    }

    private func topicRow(_ topic: ChemTopic, stage: Stage) -> some View {
        let problems = ProblemBank.problems(topic: topic)
        let solved = problems.filter { progress.stats(for: $0.id).everCorrect }.count
        return NavigationLink {
            TopicProblemListView(topic: topic)
        } label: {
            HStack(spacing: Spacing.md) {
                Image(systemName: topic.icon)
                    .frame(width: 32)
                    .foregroundColor(stage.color)
                VStack(alignment: .leading, spacing: 2) {
                    Text(topic.name).font(AppFont.cardTitle).foregroundColor(.primary)
                    Text("\(solved)/\(problems.count) 已攻克")
                        .font(.caption).foregroundColor(.secondary)
                }
                Spacer()
                ProgressView(value: problems.isEmpty ? 0 : Double(solved) / Double(problems.count))
                    .frame(width: 56)
                    .tint(stage.color)
                Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
            }
            .cardSurface(padding: Spacing.lg)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - 章节题目列表

struct TopicProblemListView: View {
    let topic: ChemTopic
    @EnvironmentObject var progress: ProgressManager
    @ObservedObject private var purchase = PurchaseManager.shared
    @State private var showPaywall = false

    private var problems: [ChemProblem] { ProblemBank.problems(topic: topic) }

    var body: some View {
        List {
            ForEach(problems) { p in
                if purchase.isProblemPremiumLocked(p) {
                    Button { showPaywall = true } label: { problemLabel(p, locked: true) }
                        .buttonStyle(.plain)
                } else {
                    NavigationLink { ProblemDetailView(problem: p) } label: {
                        problemLabel(p, locked: false)
                    }
                }
            }
        }
        .navigationTitle(topic.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showPaywall) { PaywallView() }
    }

    private func problemLabel(_ p: ChemProblem, locked: Bool) -> some View {
        HStack(spacing: Spacing.md) {
            if locked {
                Image(systemName: "crown.fill").foregroundColor(.apexGold)
            } else {
                Image(systemName: progress.stats(for: p.id).everCorrect ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(progress.stats(for: p.id).everCorrect ? .apexEmerald : .secondary)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(p.content).font(.subheadline).lineLimit(2)
                    .foregroundColor(locked ? .secondary : .primary)
                HStack(spacing: 6) {
                    TagChip(text: p.stage.shortTitle, color: p.stage.color)
                    if p.dualSolution != nil {
                        TagChip(text: "⚔️ 双解", color: .apexMystery)
                    }
                    if locked { TagChip(text: "完整版解锁", color: .apexGold) }
                }
            }
        }
        .padding(.vertical, 2)
    }
}
