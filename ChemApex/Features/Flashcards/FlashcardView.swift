import SwiftUI

// MARK: - 现象闪卡：分类列表

struct FlashcardView: View {
    @ObservedObject private var manager = FlashcardManager.shared

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("化学最苦的记忆负担，10 题一轮的颜色快问快答。答完看陷阱备注，越打越熟。")
                    .font(.caption).foregroundColor(.secondary)

                ForEach(FlashCategory.allCases) { category in
                    categoryRow(category)
                }
            }
            .padding(Spacing.lg)
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("现象闪卡")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func categoryRow(_ category: FlashCategory) -> some View {
        let count = FlashcardData.facts(in: category).count
        let best = manager.best(for: category)
        return NavigationLink {
            FlashcardGameView(category: category)
        } label: {
            HStack(spacing: Spacing.lg) {
                Image(systemName: category.icon)
                    .font(.title3)
                    .frame(width: 40, height: 40)
                    .background(Color.apexLava.opacity(0.12))
                    .foregroundColor(.apexLava)
                    .cornerRadius(Radius.inner)
                VStack(alignment: .leading, spacing: 4) {
                    Text(category.name).font(AppFont.cardTitle)
                    Text(category.subtitle).font(.caption).foregroundColor(.secondary)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    if best > 0 {
                        Text("最佳 \(best)/\(min(count, 10))")
                            .font(AppFont.chip).foregroundColor(.apexGold)
                    }
                    Text("\(count) 张").font(.caption2).foregroundColor(.secondary)
                }
                Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
            }
            .foregroundColor(.primary)
            .cardSurface(padding: Spacing.lg)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - 闪卡对战（一轮 10 题）

struct FlashcardGameView: View {
    let category: FlashCategory
    @ObservedObject private var manager = FlashcardManager.shared

    @State private var deck: [ColorFact] = []
    @State private var options: [ColorFact] = []
    @State private var index = 0
    @State private var score = 0
    @State private var picked: String? = nil   // 选中的 fact.id
    @State private var finished = false

    private var current: ColorFact? { deck.indices.contains(index) ? deck[index] : nil }

    var body: some View {
        VStack(spacing: Spacing.xl) {
            if finished {
                resultView
            } else if let fact = current {
                // 进度
                HStack {
                    Text("第 \(index + 1)/\(deck.count) 题").font(AppFont.chip).foregroundColor(.secondary)
                    Spacer()
                    Text("得分 \(score)").font(AppFont.chip).foregroundColor(.apexGold)
                }

                // 题面
                VStack(spacing: Spacing.sm) {
                    Text(fact.item)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                    Text("它是什么颜色？").font(.subheadline).foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, Spacing.xxl)
                .cardSurface(padding: Spacing.lg)

                // 颜色选项
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: Spacing.md) {
                    ForEach(options) { option in
                        colorOption(option, answer: fact)
                    }
                }

                // 答后备注 + 下一题
                if picked != nil {
                    if let note = fact.note {
                        HStack(alignment: .top, spacing: 6) {
                            Image(systemName: "lightbulb").font(.caption).foregroundColor(.apexGold)
                            Text(note).font(.caption).foregroundColor(.primary.opacity(0.8))
                        }
                        .padding(Spacing.md)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.apexGold.opacity(0.1))
                        .cornerRadius(Radius.inner)
                    }
                    Button {
                        advance()
                    } label: {
                        Text(index + 1 < deck.count ? "下一题" : "看战绩")
                            .font(AppFont.cardTitle)
                            .frame(maxWidth: .infinity)
                            .padding(Spacing.lg)
                            .background(Color.apexLava)
                            .foregroundColor(.white)
                            .cornerRadius(Radius.inner)
                    }
                    .buttonStyle(.plain)
                }
                Spacer()
            }
        }
        .padding(Spacing.lg)
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { startRound() }
    }

    // MARK: 逻辑

    private func startRound() {
        deck = Array(FlashcardData.facts(in: category).shuffled().prefix(10))
        index = 0
        score = 0
        finished = false
        picked = nil
        makeOptions()
    }

    /// 干扰项：同类别中颜色名不同的事实，凑足 4 个选项。
    private func makeOptions() {
        guard let fact = current else { return }
        var pool = FlashcardData.facts(in: category)
            .filter { $0.colorName != fact.colorName }
        // 颜色名去重，避免出现两个"白色"选项
        var seen: Set<String> = [fact.colorName]
        pool = pool.shuffled().filter { seen.insert($0.colorName).inserted }
        options = (Array(pool.prefix(3)) + [fact]).shuffled()
    }

    private func advance() {
        if index + 1 < deck.count {
            index += 1
            picked = nil
            makeOptions()
        } else {
            finished = true
            manager.record(category: category, score: score)
        }
    }

    // MARK: 组件

    private func colorOption(_ option: ColorFact, answer: ColorFact) -> some View {
        let revealed = picked != nil
        let isCorrect = option.colorName == answer.colorName
        let isPicked = option.id == picked

        var border: Color = .clear
        if revealed {
            if isCorrect { border = .apexEmerald }
            else if isPicked { border = .apexDanger }
        }

        return Button {
            guard picked == nil else { return }
            picked = option.id
            if isCorrect { score += 1 }
        } label: {
            HStack(spacing: Spacing.md) {
                Circle()
                    .fill(option.color)
                    .frame(width: 26, height: 26)
                    .overlay(Circle().stroke(Color.secondary.opacity(0.35), lineWidth: 1))
                Text(option.colorName).font(AppFont.cardTitle)
                Spacer(minLength: 0)
                if revealed, isCorrect {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.apexEmerald)
                }
            }
            .foregroundColor(.primary)
            .padding(Spacing.lg)
            .background(Color.apexCardSurface)
            .cornerRadius(Radius.inner)
            .overlay(RoundedRectangle(cornerRadius: Radius.inner).stroke(border, lineWidth: 2))
        }
        .buttonStyle(.plain)
    }

    private var resultView: some View {
        VStack(spacing: Spacing.xl) {
            Spacer()
            Text(score == deck.count ? "🏆" : (score >= deck.count * 7 / 10 ? "🎉" : "💪"))
                .font(.system(size: 64))
            Text("\(score)/\(deck.count)")
                .font(AppFont.bigStat(44)).foregroundColor(.apexLava)
            Text(score == deck.count ? "全对！这片色谱你已经焊死在脑子里了。"
                 : (score >= deck.count * 7 / 10 ? "不错！错过的颜色翻回去再看一眼备注。"
                    : "颜色题靠重复——再来一轮就熟了。"))
                .font(.subheadline).foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            if manager.best(for: category) == score, score > 0 {
                TagChip(text: "新纪录 ⭐", color: .apexGold)
            }
            Button {
                startRound()
            } label: {
                Text("再来一轮")
                    .font(AppFont.cardTitle)
                    .frame(maxWidth: .infinity)
                    .padding(Spacing.lg)
                    .background(Color.apexLava)
                    .foregroundColor(.white)
                    .cornerRadius(Radius.inner)
            }
            .buttonStyle(.plain)
            Spacer()
        }
    }
}
