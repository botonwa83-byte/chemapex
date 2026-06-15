import SwiftUI

// MARK: - 简答题训练：列表

struct ShortAnswerListView: View {
    @ObservedObject private var manager = ShortAnswerManager.shared

    private var categories: [String] {
        var seen: [String] = []
        for q in ShortAnswerData.all where !seen.contains(q.category) { seen.append(q.category) }
        return seen
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("大题最常见的失分：会做，但答不到采分点。这里练「化学语言」——先自己组织答案，再对照标准答案逐条勾采分点。")
                    .font(.caption).foregroundColor(.secondary)

                NavigationLink {
                    ShortAnswerSessionView(items: ShortAnswerData.all.shuffled(), title: "全部混练")
                } label: {
                    HStack {
                        Image(systemName: "shuffle")
                        Text("全部混练 · \(ShortAnswerData.all.count) 题（已掌握 \(manager.masteredCount)）").font(AppFont.cardTitle)
                        Spacer(); Image(systemName: "chevron.right").font(.caption)
                    }
                    .foregroundColor(.white).padding(Spacing.lg).frame(maxWidth: .infinity)
                    .background(LinearGradient(colors: [.apexStarBlue, .apexMystery], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(Radius.card)
                }
                .buttonStyle(.plain)

                ForEach(categories, id: \.self) { cat in
                    categoryCard(cat)
                }
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("简答题训练")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func categoryCard(_ cat: String) -> some View {
        let items = ShortAnswerData.all.filter { $0.category == cat }
        let done = items.filter { manager.isMastered($0.id) }.count
        return NavigationLink {
            ShortAnswerSessionView(items: items, title: cat)
        } label: {
            HStack(spacing: Spacing.lg) {
                Image(systemName: icon(cat)).font(.title3).frame(width: 40, height: 40)
                    .background(Color.apexStarBlue.opacity(0.12)).foregroundColor(.apexStarBlue)
                    .cornerRadius(Radius.inner)
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(cat)类").font(AppFont.cardTitle)
                    Text("已掌握 \(done)/\(items.count) 题").font(.caption).foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
            }
            .foregroundColor(.primary).cardSurface(padding: Spacing.lg)
        }
        .buttonStyle(.plain)
    }

    private func icon(_ cat: String) -> String {
        switch cat {
        case "检验": return "magnifyingglass"
        case "解释原因": return "questionmark.bubble"
        case "描述现象": return "eye"
        case "实验操作": return "hand.draw"
        default: return "text.alignleft"
        }
    }
}

// MARK: - 简答题一轮

struct ShortAnswerSessionView: View {
    let items: [ShortAnswer]
    let title: String
    @ObservedObject private var manager = ShortAnswerManager.shared

    @State private var index = 0
    @State private var revealed = false
    @State private var checkedPoints: Set<Int> = []

    private var current: ShortAnswer? { items.indices.contains(index) ? items[index] : nil }

    var body: some View {
        VStack(spacing: Spacing.lg) {
            if let q = current {
                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.lg) {
                        HStack {
                            TagChip(text: "\(q.category)类", color: .apexStarBlue)
                            TagChip(text: q.stage.shortTitle, color: q.stage.color)
                            Spacer()
                            Text("第 \(index + 1)/\(items.count)").font(AppFont.chip).foregroundColor(.secondary)
                        }

                        // 题目
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("📝 " + q.question).font(.body)
                            if !revealed {
                                Text("先在脑中/草稿纸组织好完整答案，再翻开对采分点 👇")
                                    .font(.caption).foregroundColor(.secondary)
                            }
                        }
                        .cardSurface(padding: Spacing.lg)

                        if revealed {
                            answerCard(q)
                            scorePointsCard(q)
                            if let tip = q.tip {
                                HStack(alignment: .top, spacing: 6) {
                                    Image(systemName: "lightbulb").font(.caption).foregroundColor(.apexMystery)
                                    Text(tip).font(.caption).foregroundColor(.apexMystery)
                                }
                                .padding(Spacing.md).frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.apexMystery.opacity(0.08)).cornerRadius(Radius.inner)
                            }
                        }
                    }
                    .padding(.horizontal, Spacing.lg)
                    .readableWidth()
                }
                bottomBar(q)
            } else {
                doneView
            }
        }
        .padding(.vertical, Spacing.lg)
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func answerCard(_ q: ShortAnswer) -> some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            SectionHeader(title: "标准答案", systemImage: "checkmark.circle", accent: .apexEmerald)
            Text(q.answer).font(.subheadline).lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.lg).background(Color.apexEmerald.opacity(0.08)).cornerRadius(Radius.card)
    }

    private func scorePointsCard(_ q: ShortAnswer) -> some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack {
                Image(systemName: "checklist").foregroundColor(.apexLava)
                Text("采分点 · 勾选你答到的（\(checkedPoints.count)/\(q.scorePoints.count)）").font(AppFont.cardTitle)
            }
            ForEach(Array(q.scorePoints.enumerated()), id: \.offset) { i, pt in
                Button {
                    if checkedPoints.contains(i) { checkedPoints.remove(i) } else { checkedPoints.insert(i) }
                } label: {
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: checkedPoints.contains(i) ? "checkmark.square.fill" : "square")
                            .foregroundColor(checkedPoints.contains(i) ? .apexEmerald : .secondary)
                        Text(pt).font(.subheadline).foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        Spacer(minLength: 0)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardSurface(padding: Spacing.lg)
    }

    @ViewBuilder
    private func bottomBar(_ q: ShortAnswer) -> some View {
        if !revealed {
            Button { withAnimation { revealed = true } } label: {
                Text("翻开标准答案 + 采分点").font(AppFont.cardTitle)
                    .frame(maxWidth: .infinity).padding(Spacing.lg)
                    .background(Color.apexLava).foregroundColor(.white).cornerRadius(Radius.inner)
            }.buttonStyle(.plain).padding(.horizontal, Spacing.lg)
        } else {
            Button {
                manager.mark(q.id, full: checkedPoints.count == q.scorePoints.count)
                next()
            } label: {
                Text(scoreLabel(q)).font(AppFont.cardTitle)
                    .frame(maxWidth: .infinity).padding(Spacing.lg)
                    .background(Color.apexEmerald).foregroundColor(.white).cornerRadius(Radius.inner)
            }.buttonStyle(.plain).padding(.horizontal, Spacing.lg)
        }
    }

    private func scoreLabel(_ q: ShortAnswer) -> String {
        let full = checkedPoints.count == q.scorePoints.count
        let base = "我答到 \(checkedPoints.count)/\(q.scorePoints.count) 点"
        return (index + 1 < items.count) ? "\(base) · 下一题" : "\(base) · 完成"
    }

    private func next() {
        withAnimation { index += 1; revealed = false; checkedPoints = [] }
    }

    private var doneView: some View {
        VStack(spacing: Spacing.md) {
            Text("📝").font(.system(size: 56))
            Text("这组简答练完").font(.headline)
            Text("大题靠「答全采分点」拿分——把这些标准说法记熟，考场上照着踩点写。")
                .font(.subheadline).foregroundColor(.secondary).multilineTextAlignment(.center)
                .padding(.horizontal, Spacing.xxl)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
