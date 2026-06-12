import SwiftUI

// MARK: - 化学神探：案件列表

struct DetectiveView: View {
    @ObservedObject private var manager = DetectiveManager.shared

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                // 战绩
                HStack(spacing: Spacing.lg) {
                    statBlock(value: "\(manager.solvedCount)/\(DetectiveData.all.count)", label: "已破案件", color: .apexMystery)
                    statBlock(value: "\(manager.totalStars)", label: "累计星级 ⭐", color: .apexGold)
                }
                .cardSurface(padding: Spacing.lg)

                Text("推断题就是破案：线索逐条揭开，随时指认嫌疑物质。揭得越少猜中，星级越高（错猜降星）。")
                    .font(.caption).foregroundColor(.secondary)

                ForEach(DetectiveData.all) { c in
                    caseRow(c)
                }
            }
            .padding(Spacing.lg)
        }
        .background(Color.mysteryBackground.ignoresSafeArea())
        .navigationTitle("化学神探")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func statBlock(value: String, label: String, color: Color) -> some View {
        VStack(spacing: 2) {
            Text(value).font(AppFont.bigStat(22)).foregroundColor(color)
            Text(label).font(.caption2).foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }

    private func caseRow(_ c: DetectiveCase) -> some View {
        let stars = manager.bestStars[c.id] ?? 0
        return NavigationLink {
            DetectiveCaseView(detectiveCase: c)
        } label: {
            HStack(spacing: Spacing.lg) {
                Image(systemName: stars > 0 ? "checkmark.seal.fill" : "magnifyingglass")
                    .font(.title3)
                    .frame(width: 40, height: 40)
                    .background(Color.apexMystery.opacity(0.12))
                    .foregroundColor(stars > 0 ? .apexGold : .apexMystery)
                    .cornerRadius(Radius.inner)
                VStack(alignment: .leading, spacing: 4) {
                    Text(c.title).font(AppFont.cardTitle)
                    HStack(spacing: 6) {
                        TagChip(text: c.topic.name, color: .apexStarBlue)
                        TagChip(text: "\(c.clues.count) 条线索", color: .apexMystery)
                    }
                }
                Spacer()
                if stars > 0 {
                    HStack(spacing: 1) {
                        ForEach(0..<3, id: \.self) { i in
                            Image(systemName: i < stars ? "star.fill" : "star")
                                .font(.caption2)
                                .foregroundColor(.apexGold)
                        }
                    }
                } else {
                    Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
                }
            }
            .foregroundColor(.primary)
            .cardSurface(padding: Spacing.lg)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - 探案现场

struct DetectiveCaseView: View {
    let detectiveCase: DetectiveCase
    @ObservedObject private var manager = DetectiveManager.shared

    @State private var revealedCount = 1
    @State private var eliminated: Set<Int> = []
    @State private var wrongGuesses = 0
    @State private var solved = false
    @State private var lastWrongIndex: Int? = nil

    private var earnedStars: Int {
        DetectiveManager.stars(cluesRevealed: revealedCount, wrongGuesses: wrongGuesses)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                // 嫌疑人面板
                SectionHeader(title: "嫌疑物质", systemImage: "person.crop.rectangle.stack", accent: .apexMystery)
                suspectGrid

                if let wrong = lastWrongIndex {
                    Text("「\(detectiveCase.suspects[wrong])」嫌疑排除——但错误指认让星级降了一档，再想想。")
                        .font(.caption).foregroundColor(.apexDanger)
                }

                // 线索链
                SectionHeader(title: "线索 · \(revealedCount)/\(detectiveCase.clues.count)", systemImage: "doc.text.magnifyingglass", accent: .apexGold)
                ForEach(detectiveCase.clues.prefix(revealedCount)) { clue in
                    ClueCard(clue: clue, revealDeduction: solved)
                }

                if !solved, revealedCount < detectiveCase.clues.count {
                    Button {
                        withAnimation { revealedCount += 1 }
                    } label: {
                        Label("揭开下一条线索（星级可能下降）", systemImage: "hand.point.right")
                            .font(AppFont.cardTitle)
                            .frame(maxWidth: .infinity)
                            .padding(Spacing.lg)
                            .background(Color.apexMystery.opacity(0.12))
                            .foregroundColor(.apexMystery)
                            .cornerRadius(Radius.inner)
                    }
                    .buttonStyle(.plain)
                }

                // 结案陈词
                if solved {
                    verdictCard
                }
            }
            .padding(Spacing.lg)
        }
        .background(Color.mysteryBackground.ignoresSafeArea())
        .navigationTitle(detectiveCase.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: 组件

    private var suspectGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: Spacing.md) {
            ForEach(detectiveCase.suspects.indices, id: \.self) { i in
                suspectChip(i)
            }
        }
    }

    private func suspectChip(_ index: Int) -> some View {
        let isAnswer = index == detectiveCase.answerIndex
        let isEliminated = eliminated.contains(index)
        let highlight = solved && isAnswer

        return Button {
            guard !solved, !isEliminated else { return }
            if isAnswer {
                withAnimation { solved = true }
                manager.record(caseId: detectiveCase.id, stars: earnedStars)
            } else {
                withAnimation {
                    eliminated.insert(index)
                    wrongGuesses += 1
                    lastWrongIndex = index
                }
            }
        } label: {
            Text(detectiveCase.suspects[index])
                .font(AppFont.cardTitle)
                .strikethrough(isEliminated)
                .frame(maxWidth: .infinity)
                .padding(.vertical, Spacing.md)
                .background(highlight ? Color.apexGold.opacity(0.25) : Color.apexCardSurface)
                .foregroundColor(isEliminated ? .secondary : (highlight ? .apexGold : .primary))
                .cornerRadius(Radius.inner)
                .overlay(
                    RoundedRectangle(cornerRadius: Radius.inner)
                        .stroke(highlight ? Color.apexGold : Color.apexMystery.opacity(0.3), lineWidth: highlight ? 2 : 1)
                )
                .opacity(isEliminated ? 0.5 : 1)
        }
        .buttonStyle(.plain)
    }

    private var verdictCard: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            HStack {
                Text("🎉 真相大白").font(.headline)
                Spacer()
                HStack(spacing: 2) {
                    ForEach(0..<3, id: \.self) { i in
                        Image(systemName: i < earnedStars ? "star.fill" : "star")
                            .foregroundColor(.apexGold)
                    }
                }
            }
            Text("仅用 \(revealedCount) 条线索破案" + (wrongGuesses > 0 ? "（错猜 \(wrongGuesses) 次）" : "，零失误！"))
                .font(.caption).foregroundColor(.secondary)
            Divider()
            Text(detectiveCase.verdict).font(.subheadline)
            Text("提示：上方每条线索现已展开「推理价值」，回看一遍完整的排除链。")
                .font(.caption).foregroundColor(.apexMystery)
        }
        .padding(Spacing.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.mysteryPaper)
        .cornerRadius(Radius.card)
        .cardShadow()
    }
}

// MARK: - 线索卡

struct ClueCard: View {
    let clue: DetectiveClue
    let revealDeduction: Bool
    @State private var expanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack(alignment: .top, spacing: Spacing.sm) {
                Image(systemName: "doc.text.magnifyingglass")
                    .font(.caption).foregroundColor(.apexGold)
                    .padding(.top, 2)
                Text(clue.text).font(.subheadline)
            }
            if revealDeduction || expanded {
                HStack(alignment: .top, spacing: 6) {
                    Image(systemName: "brain").font(.caption).foregroundColor(.apexMystery)
                    Text(clue.deduction).font(.caption).foregroundColor(.apexMystery)
                }
                .padding(Spacing.sm)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.apexMystery.opacity(0.08))
                .cornerRadius(Radius.inner)
            } else {
                Button {
                    withAnimation { expanded = true }
                } label: {
                    Text("🔍 看这条线索的推理价值（剧透警告）")
                        .font(.caption2).foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
            }
        }
        .cardSurface(padding: Spacing.lg)
    }
}
