import SwiftUI

// MARK: - 做题页：选择 → 判定 → 解析（答题记录驱动主线进度）

struct ProblemDetailView: View {
    let problem: ChemProblem
    @EnvironmentObject var progress: ProgressManager

    @State private var selectedIndex: Int? = nil
    @State private var revealed = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                // 题干
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    HStack(spacing: 6) {
                        TagChip(text: problem.stage.shortTitle, color: problem.stage.color)
                        TagChip(text: problem.topic.name, color: .apexStarBlue)
                        Spacer()
                        Button {
                            progress.toggleFlag(problemId: problem.id)
                        } label: {
                            Image(systemName: progress.stats(for: problem.id).flagged ? "star.fill" : "star")
                                .foregroundColor(.apexGold)
                        }
                    }
                    Text(problem.content).font(.body)
                }
                .cardSurface(padding: Spacing.lg)

                // 选项
                VStack(spacing: Spacing.md) {
                    ForEach(problem.options.indices, id: \.self) { i in
                        optionButton(i)
                    }
                }

                // 解析
                if revealed {
                    resultBanner
                    VStack(alignment: .leading, spacing: Spacing.sm) {
                        SectionHeader(title: "解析", systemImage: "lightbulb", accent: .apexGold)
                        Text(problem.explanation).font(.subheadline)
                    }
                    .cardSurface(padding: Spacing.lg)

                    // 方法教练：这道题练的是哪把武器
                    if problem.dualSolution == nil,
                       let weapon = problem.weapon,
                       let guide = WeaponGuideData.guide(for: weapon) {
                        NavigationLink {
                            WeaponDetailView(guide: guide)
                        } label: {
                            HStack {
                                Image(systemName: weapon.icon)
                                Text("这道题练的是「\(weapon.name)」· 学方法")
                                    .font(AppFont.cardTitle)
                                Spacer()
                                Image(systemName: "chevron.right").font(.caption)
                            }
                            .foregroundColor(weapon.stage.color)
                            .padding(Spacing.lg)
                            .frame(maxWidth: .infinity)
                            .background(weapon.stage.color.opacity(0.1))
                            .cornerRadius(Radius.card)
                        }
                    }

                    if let dual = problem.dualSolution {
                        NavigationLink {
                            DescentDetailView(problem: problem, dual: dual)
                        } label: {
                            HStack {
                                Image(systemName: "eye")
                                Text("进入双解对决 · \(dual.weapon.name)")
                                    .font(AppFont.cardTitle)
                                Spacer()
                                TagChip(text: String(format: "快 %.0f 倍", dual.timeRatio), color: .apexMystery)
                            }
                            .foregroundColor(.apexMystery)
                            .padding(Spacing.lg)
                            .frame(maxWidth: .infinity)
                            .background(Color.mysteryBackground)
                            .cornerRadius(Radius.card)
                        }
                    }
                }
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("练习")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: 组件

    private func optionButton(_ index: Int) -> some View {
        let label = ["A", "B", "C", "D"][min(index, 3)]
        let isCorrect = index == problem.answerIndex
        let isSelected = index == selectedIndex

        var borderColor: Color = .clear
        if revealed {
            if isCorrect { borderColor = .apexEmerald }
            else if isSelected { borderColor = .apexDanger }
        }

        return Button {
            guard !revealed else { return }
            selectedIndex = index
            revealed = true
            progress.record(problemId: problem.id, correct: isCorrect)
        } label: {
            HStack(spacing: Spacing.md) {
                Text(label)
                    .font(AppFont.cardTitle)
                    .frame(width: 28, height: 28)
                    .background(Circle().fill(Color.apexStarBlue.opacity(0.12)))
                Text(problem.options[index])
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                Spacer(minLength: 0)
                if revealed, isCorrect {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.apexEmerald)
                }
                if revealed, isSelected, !isCorrect {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.apexDanger)
                }
            }
            .foregroundColor(.primary)
            .padding(Spacing.lg)
            .frame(maxWidth: .infinity)
            .background(Color.apexCardSurface)
            .cornerRadius(Radius.inner)
            .overlay(RoundedRectangle(cornerRadius: Radius.inner).stroke(borderColor, lineWidth: 2))
        }
        .buttonStyle(.plain)
    }

    private var resultBanner: some View {
        let correct = selectedIndex == problem.answerIndex
        return HStack {
            Image(systemName: correct ? "checkmark.seal.fill" : "exclamationmark.triangle.fill")
            Text(correct ? "答对了！主线进度 +1" : "答错了，已收入错题本")
                .font(AppFont.cardTitle)
            Spacer()
        }
        .foregroundColor(correct ? .apexEmerald : .apexDanger)
        .padding(Spacing.lg)
        .background((correct ? Color.apexEmerald : Color.apexDanger).opacity(0.1))
        .cornerRadius(Radius.inner)
    }
}
