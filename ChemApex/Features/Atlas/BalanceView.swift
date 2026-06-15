import SwiftUI

// MARK: - 配平训练：列表

struct BalanceListView: View {
    @ObservedObject private var manager = BalanceManager.shared

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("光会认方程式不够，得会配平。点系数、当场判对错——把「不会写」练成「闭眼配」。")
                    .font(.caption).foregroundColor(.secondary)

                HStack(spacing: Spacing.lg) {
                    statBlock("\(manager.solvedCount)/\(BalanceData.all.count)", "已配平", .apexLava)
                    NavigationLink {
                        BalanceSessionView(problems: weakFirst(), title: "配平闯关")
                    } label: {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("开始配平").font(AppFont.cardTitle)
                        }
                        .foregroundColor(.white).padding(.vertical, Spacing.md).padding(.horizontal, Spacing.xl)
                        .background(Color.apexLava).cornerRadius(Radius.inner)
                    }
                    .buttonStyle(.plain)
                }
                .cardSurface(padding: Spacing.lg)

                ForEach(BalanceData.all) { p in
                    NavigationLink {
                        BalanceSessionView(problems: [p], title: "配平")
                    } label: {
                        HStack(spacing: Spacing.md) {
                            Image(systemName: manager.solved.contains(p.id) ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(manager.solved.contains(p.id) ? .apexEmerald : .secondary)
                            Text(skeleton(p)).font(.system(.subheadline, design: .monospaced)).lineLimit(1)
                            Spacer(minLength: 0)
                            TagChip(text: p.stage.shortTitle, color: p.stage.color)
                        }
                        .foregroundColor(.primary)
                        .cardSurface(padding: Spacing.md)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("配平训练")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func skeleton(_ p: BalanceProblem) -> String {
        p.reactants.joined(separator: " + ") + " → " + p.products.joined(separator: " + ")
    }
    private func statBlock(_ v: String, _ l: String, _ c: Color) -> some View {
        VStack(spacing: 2) {
            Text(v).font(AppFont.bigStat(22)).foregroundColor(c)
            Text(l).font(.caption2).foregroundColor(.secondary)
        }
    }
    private func weakFirst() -> [BalanceProblem] {
        BalanceData.all.sorted { a, b in
            !manager.solved.contains(a.id) && manager.solved.contains(b.id)
        }
    }
}

// MARK: - 配平一题

struct BalanceSessionView: View {
    let problems: [BalanceProblem]
    let title: String
    @ObservedObject private var manager = BalanceManager.shared

    @State private var index = 0
    @State private var coeffs: [Int] = []
    @State private var checked = false
    @State private var correct = false
    @State private var showHint = false

    private var current: BalanceProblem? { problems.indices.contains(index) ? problems[index] : nil }

    var body: some View {
        VStack(spacing: Spacing.lg) {
            if let p = current {
                HStack {
                    Text("第 \(index + 1)/\(problems.count) 题").font(AppFont.chip).foregroundColor(.secondary)
                    Spacer()
                    TagChip(text: p.condition, color: .apexGold)
                }
                .padding(.horizontal, Spacing.lg)

                Spacer()

                // 方程式 + 系数填空
                equationRow(p)
                    .padding(.horizontal, Spacing.lg)

                if checked {
                    resultBanner(p)
                }
                if showHint && !checked {
                    Text("💡 \(p.hint)").font(.caption).foregroundColor(.apexMystery)
                        .padding(Spacing.md).frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.apexMystery.opacity(0.08)).cornerRadius(Radius.inner)
                        .padding(.horizontal, Spacing.lg)
                }

                Spacer()
                bottomBar(p)
            } else {
                doneView
            }
        }
        .padding(.vertical, Spacing.lg)
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { loadCurrent() }
    }

    private func equationRow(_ p: BalanceProblem) -> some View {
        // 反应物 + → + 生成物，每个物质前一个系数步进器
        FlowLayout(spacing: 6) {
            ForEach(Array(p.species.enumerated()), id: \.offset) { i, sp in
                HStack(spacing: 2) {
                    coeffStepper(i)
                    Text(sp).font(.system(.title3, design: .monospaced).weight(.medium))
                    // 连接符
                    if i < p.reactants.count - 1 {
                        Text(" + ").foregroundColor(.secondary)
                    } else if i == p.reactants.count - 1 {
                        Text(" → ").foregroundColor(.apexLava).font(.title3)
                    } else if i < p.species.count - 1 {
                        Text(" + ").foregroundColor(.secondary)
                    }
                }
            }
        }
    }

    private func coeffStepper(_ i: Int) -> some View {
        let val = coeffs.indices.contains(i) ? coeffs[i] : 1
        return Button {
            guard !checked else { return }
            if coeffs.indices.contains(i) {
                coeffs[i] = val >= 9 ? 1 : val + 1   // 点一下 +1，9 后回到 1
            }
        } label: {
            Text("\(val)")
                .font(.system(.title3, design: .rounded).weight(.bold))
                .frame(width: 30, height: 34)
                .background(checked ? (correct ? Color.apexEmerald.opacity(0.2) : Color.apexLava.opacity(0.15)) : Color.apexLava.opacity(0.12))
                .foregroundColor(.apexLava)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.apexLava.opacity(0.4), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }

    private func resultBanner(_ p: BalanceProblem) -> some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack {
                Image(systemName: correct ? "checkmark.seal.fill" : "xmark.octagon.fill")
                Text(correct ? "配平正确！" : "还没配平，正确系数见下").font(AppFont.cardTitle)
                Spacer()
            }
            .foregroundColor(correct ? .apexEmerald : .apexDanger)
            if !correct {
                Text("正确：" + balancedString(p))
                    .font(.system(.subheadline, design: .monospaced))
                Text("思路：\(p.hint)").font(.caption).foregroundColor(.secondary)
            }
        }
        .padding(Spacing.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background((correct ? Color.apexEmerald : Color.apexDanger).opacity(0.1))
        .cornerRadius(Radius.card)
        .padding(.horizontal, Spacing.lg)
    }

    @ViewBuilder
    private func bottomBar(_ p: BalanceProblem) -> some View {
        if !checked {
            HStack(spacing: Spacing.md) {
                Button { withAnimation { showHint.toggle() } } label: {
                    Label("提示", systemImage: "lightbulb")
                        .font(AppFont.cardTitle).frame(maxWidth: .infinity).padding(Spacing.lg)
                        .background(Color.apexMystery.opacity(0.12)).foregroundColor(.apexMystery)
                        .cornerRadius(Radius.inner)
                }.buttonStyle(.plain)
                Button { check(p) } label: {
                    Text("检查配平").font(AppFont.cardTitle).frame(maxWidth: .infinity).padding(Spacing.lg)
                        .background(Color.apexLava).foregroundColor(.white).cornerRadius(Radius.inner)
                }.buttonStyle(.plain)
            }
            .padding(.horizontal, Spacing.lg)
        } else {
            Button { next() } label: {
                Text(index + 1 < problems.count ? "下一题" : "完成").font(AppFont.cardTitle)
                    .frame(maxWidth: .infinity).padding(Spacing.lg)
                    .background(Color.apexLava).foregroundColor(.white).cornerRadius(Radius.inner)
            }.buttonStyle(.plain).padding(.horizontal, Spacing.lg)
        }
    }

    private var doneView: some View {
        VStack(spacing: Spacing.md) {
            Text("⚖️").font(.system(size: 56))
            Text("这组配平完成").font(.headline)
            Text("配平靠手感，多练几组就形成肌肉记忆了。").font(.subheadline).foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: 逻辑

    private func loadCurrent() {
        guard let p = current else { return }
        coeffs = Array(repeating: 1, count: p.species.count)
        checked = false; correct = false; showHint = false
    }
    private func check(_ p: BalanceProblem) {
        correct = BalanceManager.isCorrect(coeffs, answer: p.answer)
        if correct { manager.markSolved(p.id) }
        withAnimation { checked = true }
    }
    private func next() {
        withAnimation { index += 1 }
        loadCurrent()
    }
    private func balancedString(_ p: BalanceProblem) -> String {
        func term(_ c: Int, _ sp: String) -> String { (c == 1 ? "" : "\(c)") + sp }
        let r = zip(p.answer.prefix(p.reactants.count), p.reactants).map { term($0, $1) }.joined(separator: " + ")
        let pr = zip(p.answer.suffix(p.products.count), p.products).map { term($0, $1) }.joined(separator: " + ")
        return r + " → " + pr
    }
}
