import SwiftUI

// MARK: - 方程式默写训练：分组入口

struct EquationDrillView: View {
    @ObservedObject private var manager = EquationDrillManager.shared

    /// 按段位分组（初中 / 高中），每组里再按是否掌握出题。
    private var groups: [(stage: Stage, eqs: [ChemEquation])] {
        Stage.allCases.compactMap { stage in
            let eqs = EquationLibrary.all.filter { $0.stage == stage }
            return eqs.isEmpty ? nil : (stage, eqs)
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("方程式光看记不住——这里练默写：看提示在脑中写出方程式，翻开对答案，自评记没记住。没记住的会安排复习。")
                    .font(.caption).foregroundColor(.secondary)

                ForEach(groups, id: \.stage) { group in
                    groupCard(group.stage, group.eqs)
                }

                NavigationLink {
                    EquationDrillSessionView(equations: weakFirst(EquationLibrary.all), title: "全部 · 优先没记住的")
                } label: {
                    HStack {
                        Image(systemName: "shuffle")
                        Text("混合默写 · 全部 \(EquationLibrary.all.count) 条").font(AppFont.cardTitle)
                        Spacer()
                        Image(systemName: "chevron.right").font(.caption)
                    }
                    .foregroundColor(.white)
                    .padding(Spacing.lg)
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(colors: [.apexLava, .apexMystery], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(Radius.card)
                }
                .buttonStyle(.plain)
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("方程式默写")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func groupCard(_ stage: Stage, _ eqs: [ChemEquation]) -> some View {
        let done = manager.masteredCount(in: eqs)
        return NavigationLink {
            EquationDrillSessionView(equations: weakFirst(eqs), title: "\(stage.shortTitle)篇")
        } label: {
            HStack(spacing: Spacing.lg) {
                Image(systemName: "pencil.and.outline")
                    .font(.title3).frame(width: 40, height: 40)
                    .background(stage.color.opacity(0.15)).foregroundColor(stage.color)
                    .cornerRadius(Radius.inner)
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(stage.emoji) \(stage.shortTitle)篇").font(AppFont.cardTitle)
                    Text("已记住 \(done)/\(eqs.count) 条").font(.caption).foregroundColor(.secondary)
                }
                Spacer()
                ProgressView(value: eqs.isEmpty ? 0 : Double(done)/Double(eqs.count))
                    .frame(width: 56).tint(stage.color)
                Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
            }
            .foregroundColor(.primary)
            .cardSurface(padding: Spacing.lg)
        }
        .buttonStyle(.plain)
    }

    /// 没记住的排前面，让训练优先攻薄弱。
    private func weakFirst(_ eqs: [ChemEquation]) -> [ChemEquation] {
        eqs.sorted { a, b in
            let am = manager.isMastered(a.id), bm = manager.isMastered(b.id)
            return !am && bm
        }
    }
}

// MARK: - 默写一轮

struct EquationDrillSessionView: View {
    let equations: [ChemEquation]
    let title: String
    @ObservedObject private var manager = EquationDrillManager.shared

    @State private var index = 0
    @State private var revealed = false
    @State private var roundDone = 0   // 本轮自评过的题数
    @State private var roundRemembered = 0

    private var current: ChemEquation? { equations.indices.contains(index) ? equations[index] : nil }
    private var finished: Bool { index >= equations.count }

    var body: some View {
        VStack(spacing: Spacing.lg) {
            if finished {
                resultView
            } else if let eq = current {
                progressBar

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.lg) {
                        promptCard(eq)
                        if revealed {
                            answerCard(eq)
                        }
                    }
                    .padding(.horizontal, Spacing.lg)
                    .readableWidth()
                }

                Spacer(minLength: 0)
                bottomBar(eq)
            }
        }
        .padding(.vertical, Spacing.lg)
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var progressBar: some View {
        HStack {
            Text("第 \(index + 1)/\(equations.count) 条").font(AppFont.chip).foregroundColor(.secondary)
            Spacer()
            Text("本轮记住 \(roundRemembered)").font(AppFont.chip).foregroundColor(.apexEmerald)
        }
        .padding(.horizontal, Spacing.lg)
    }

    private func promptCard(_ eq: ChemEquation) -> some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            HStack(spacing: 6) {
                TagChip(text: eq.topic.name, color: .apexStarBlue)
                TagChip(text: eq.condition, color: .apexGold)
                if manager.isMastered(eq.id) {
                    Image(systemName: "checkmark.seal.fill").font(.caption2).foregroundColor(.apexEmerald)
                }
            }
            Text("✍️ 写出下面情境的化学方程式").font(AppFont.cardTitle)
            VStack(alignment: .leading, spacing: 6) {
                infoLine("考点", eq.examPoint, .apexLava)
                infoLine("现象", eq.phenomenon, .apexStarBlue)
            }
            if !revealed {
                Text("先在草稿纸/脑中写出来，再翻开对答案 👇")
                    .font(.caption).foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardSurface(padding: Spacing.lg)
    }

    private func answerCard(_ eq: ChemEquation) -> some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            SectionHeader(title: "标准答案", systemImage: "checkmark.circle", accent: .apexEmerald)
            Text(eq.formula)
                .font(.system(.body, design: .monospaced).weight(.semibold))
                .textSelection(.enabled)
            if let ionic = eq.ionic {
                Text("离子方程式：\(ionic)")
                    .font(.system(.caption, design: .monospaced)).foregroundColor(.apexEmerald)
            }
            if let trap = eq.trap {
                HStack(alignment: .top, spacing: 6) {
                    Image(systemName: "exclamationmark.triangle.fill").font(.caption).foregroundColor(.apexDanger)
                    Text(trap).font(.caption).foregroundColor(.apexDanger)
                }
                .padding(Spacing.sm)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.apexDanger.opacity(0.08))
                .cornerRadius(Radius.inner)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.lg)
        .background(Color.apexEmerald.opacity(0.08))
        .cornerRadius(Radius.card)
    }

    @ViewBuilder
    private func bottomBar(_ eq: ChemEquation) -> some View {
        if !revealed {
            Button { withAnimation { revealed = true } } label: {
                Text("翻开答案").font(AppFont.cardTitle)
                    .frame(maxWidth: .infinity).padding(Spacing.lg)
                    .background(Color.apexLava).foregroundColor(.white).cornerRadius(Radius.inner)
            }
            .buttonStyle(.plain).padding(.horizontal, Spacing.lg)
        } else {
            HStack(spacing: Spacing.md) {
                Button { rate(eq, remembered: false) } label: {
                    Label("没记住", systemImage: "xmark")
                        .font(AppFont.cardTitle).frame(maxWidth: .infinity).padding(Spacing.lg)
                        .background(Color.apexDanger.opacity(0.15)).foregroundColor(.apexDanger)
                        .cornerRadius(Radius.inner)
                }.buttonStyle(.plain)
                Button { rate(eq, remembered: true) } label: {
                    Label("记住了", systemImage: "checkmark")
                        .font(AppFont.cardTitle).frame(maxWidth: .infinity).padding(Spacing.lg)
                        .background(Color.apexEmerald).foregroundColor(.white)
                        .cornerRadius(Radius.inner)
                }.buttonStyle(.plain)
            }
            .padding(.horizontal, Spacing.lg)
        }
    }

    private func rate(_ eq: ChemEquation, remembered: Bool) {
        manager.mark(eq.id, mastered: remembered)
        if remembered { roundRemembered += 1 }
        roundDone += 1
        withAnimation {
            revealed = false
            index += 1
        }
    }

    private var resultView: some View {
        VStack(spacing: Spacing.lg) {
            Spacer()
            Text(roundRemembered == equations.count ? "🏆" : "✍️").font(.system(size: 60))
            Text("\(roundRemembered)/\(equations.count)").font(AppFont.bigStat(40)).foregroundColor(.apexLava)
            Text("本轮记住 \(roundRemembered) 条，没记住的下次会优先出现。\n方程式靠反复默写，多过几轮就刻进脑子了。")
                .font(.subheadline).foregroundColor(.secondary).multilineTextAlignment(.center)
                .padding(.horizontal, Spacing.xxl)
            Button {
                index = 0; roundDone = 0; roundRemembered = 0; revealed = false
            } label: {
                Text("再练一轮").font(AppFont.cardTitle)
                    .frame(maxWidth: .infinity).padding(Spacing.lg)
                    .background(Color.apexLava).foregroundColor(.white).cornerRadius(Radius.inner)
            }
            .buttonStyle(.plain).padding(.horizontal, Spacing.lg)
            Spacer()
        }
    }

    private func infoLine(_ label: String, _ text: String, _ color: Color) -> some View {
        HStack(alignment: .top, spacing: 6) {
            Text(label).font(AppFont.chip).foregroundColor(color).frame(width: 32, alignment: .leading)
            Text(text).font(.subheadline)
        }
    }
}
