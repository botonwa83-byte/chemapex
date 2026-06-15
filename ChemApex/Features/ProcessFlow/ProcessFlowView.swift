import SwiftUI

// MARK: - 工艺流程题：流程列表

struct ProcessFlowListView: View {
    @ObservedObject private var manager = ProcessFlowManager.shared
    @ObservedObject private var purchase = PurchaseManager.shared
    @State private var showPaywall = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("工业流程是一条线性链：原料一步步变成产品。在关键决策点（加什么试剂、为什么这个顺序）填空，选对才点亮下一步。")
                    .font(.caption).foregroundColor(.secondary)

                ForEach(Array(ProcessFlowData.all.enumerated()), id: \.element.id) { index, flow in
                    flowRow(flow, premiumLocked: purchase.isProcessPremiumLocked(index: index))
                }
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("工艺流程")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showPaywall) { PaywallView() }
    }

    @ViewBuilder
    private func flowRow(_ flow: ProcessFlow, premiumLocked: Bool) -> some View {
        if premiumLocked {
            Button { showPaywall = true } label: { flowLabel(flow, premiumLocked: true) }
                .buttonStyle(.plain)
        } else {
            NavigationLink { ProcessFlowDetailView(flow: flow) } label: { flowLabel(flow, premiumLocked: false) }
                .buttonStyle(.plain)
        }
    }

    private func flowLabel(_ flow: ProcessFlow, premiumLocked: Bool) -> some View {
        let stars = manager.bestStars[flow.id] ?? 0
        return HStack(spacing: Spacing.lg) {
            Image(systemName: premiumLocked ? "crown.fill" : "arrow.triangle.branch")
                .font(.title3)
                .frame(width: 40, height: 40)
                .background(Color.apexStarBlue.opacity(0.12))
                .foregroundColor(premiumLocked ? .apexGold : .apexStarBlue)
                .cornerRadius(Radius.inner)
            VStack(alignment: .leading, spacing: 4) {
                Text(flow.title).font(AppFont.cardTitle)
                HStack(spacing: 6) {
                    TagChip(text: flow.stage.shortTitle, color: flow.stage.color)
                    TagChip(text: "\(flow.quizCount) 处填空", color: .apexStarBlue)
                    if premiumLocked { TagChip(text: "完整版解锁", color: .apexGold) }
                }
            }
            Spacer()
            if stars > 0, !premiumLocked {
                HStack(spacing: 1) {
                    ForEach(0..<3, id: \.self) { i in
                        Image(systemName: i < stars ? "star.fill" : "star")
                            .font(.caption2).foregroundColor(.apexGold)
                    }
                }
            } else {
                Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
            }
        }
        .foregroundColor(.primary)
        .cardSurface(padding: Spacing.lg)
        .opacity(premiumLocked ? 0.7 : 1)
    }
}

// MARK: - 流程详情：竖向链 + 内联填空

struct ProcessFlowDetailView: View {
    let flow: ProcessFlow
    @ObservedObject private var manager = ProcessFlowManager.shared

    @State private var solvedSteps: Set<String> = []
    @State private var mistakes = 0
    @State private var feedback: String? = nil

    /// 截至 stepIndex（含）之前的所有填空都已解开，该步才可见/可答。
    private func stepUnlocked(_ index: Int) -> Bool {
        for i in 0..<index where flow.steps[i].quiz != nil {
            if !solvedSteps.contains(flow.steps[i].id) { return false }
        }
        return true
    }

    private var allSolved: Bool {
        flow.steps.allSatisfy { $0.quiz == nil || solvedSteps.contains($0.id) }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text(flow.overview)
                    .font(.subheadline).foregroundColor(.secondary)
                    .padding(.bottom, Spacing.xs)

                // 流程链
                VStack(spacing: 0) {
                    ForEach(Array(flow.nodes.enumerated()), id: \.element.id) { i, node in
                        nodeBox(node)
                        if i < flow.steps.count {
                            arrowSegment(step: flow.steps[i], index: i)
                        }
                    }
                }

                if let feedback {
                    HStack(alignment: .top, spacing: 6) {
                        Image(systemName: "xmark.octagon.fill").foregroundColor(.apexDanger)
                        Text(feedback).font(.caption).foregroundColor(.apexDanger)
                    }
                    .padding(Spacing.md)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.apexDanger.opacity(0.08))
                    .cornerRadius(Radius.inner)
                }

                if allSolved { successCard }
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle(flow.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: 节点框

    private func nodeBox(_ node: ProcessNode) -> some View {
        Text(node.substance)
            .font(.subheadline.weight(.medium))
            .multilineTextAlignment(.center)
            .foregroundColor(node.highlight ? .white : .primary)
            .padding(.horizontal, Spacing.lg)
            .padding(.vertical, Spacing.md)
            .frame(maxWidth: .infinity)
            .background(node.highlight ? Color.apexEmerald : Color.apexCardSurface)
            .cornerRadius(Radius.inner)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.inner)
                    .stroke(node.highlight ? Color.apexEmerald : Color.apexStarBlue.opacity(0.4), lineWidth: 1.5)
            )
    }

    // MARK: 箭头段（操作标签 / 填空）

    @ViewBuilder
    private func arrowSegment(step: ProcessStep, index: Int) -> some View {
        let unlocked = stepUnlocked(index)
        let solved = step.quiz == nil || solvedSteps.contains(step.id)

        HStack(alignment: .top, spacing: Spacing.md) {
            // 箭头列
            VStack(spacing: 0) {
                Rectangle().fill(Color.apexStarBlue.opacity(0.5)).frame(width: 2, height: 14)
                Image(systemName: "arrowtriangle.down.fill")
                    .font(.system(size: 10)).foregroundColor(.apexStarBlue.opacity(0.6))
            }
            .frame(width: 24)

            // 标签 / 填空
            if !unlocked {
                Text("先完成上一处填空")
                    .font(.caption).foregroundColor(.secondary.opacity(0.5))
                    .padding(.vertical, Spacing.sm)
            } else if solved {
                VStack(alignment: .leading, spacing: 4) {
                    Text(step.operation).font(AppFont.cardTitle).foregroundColor(.apexStarBlue)
                    Text(step.sideNote).font(.caption).foregroundColor(.secondary)
                }
                .padding(.vertical, Spacing.xs)
            } else if let quiz = step.quiz {
                quizBlock(step: step, quiz: quiz)
            }
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func quizBlock(step: ProcessStep, quiz: ProcessQuiz) -> some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack(spacing: 6) {
                Image(systemName: "questionmark.circle.fill").foregroundColor(.apexLava)
                Text(quiz.prompt).font(AppFont.cardTitle)
            }
            ForEach(quiz.options.indices, id: \.self) { i in
                Button {
                    answer(step: step, quiz: quiz, choice: i)
                } label: {
                    HStack {
                        Text(quiz.options[i]).font(.subheadline)
                            .multilineTextAlignment(.leading)
                        Spacer(minLength: 0)
                    }
                    .foregroundColor(.primary)
                    .padding(Spacing.md)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.apexCardSurface)
                    .cornerRadius(Radius.inner)
                    .overlay(RoundedRectangle(cornerRadius: Radius.inner)
                        .stroke(Color.apexLava.opacity(0.4), lineWidth: 1))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(Spacing.md)
        .background(Color.apexLava.opacity(0.06))
        .cornerRadius(Radius.inner)
    }

    private func answer(step: ProcessStep, quiz: ProcessQuiz, choice: Int) {
        if choice == quiz.answerIndex {
            withAnimation {
                solvedSteps.insert(step.id)
                feedback = nil
            }
            if allSolved {
                manager.record(flowId: flow.id, stars: ProcessFlowManager.stars(mistakes: mistakes))
            }
        } else {
            mistakes += 1
            withAnimation { feedback = quiz.explanation }
        }
    }

    private var successCard: some View {
        let stars = ProcessFlowManager.stars(mistakes: mistakes)
        return VStack(alignment: .leading, spacing: Spacing.md) {
            HStack {
                Text("🏭 流程打通").font(.headline)
                Spacer()
                HStack(spacing: 2) {
                    ForEach(0..<3, id: \.self) { i in
                        Image(systemName: i < stars ? "star.fill" : "star")
                            .foregroundColor(.apexGold)
                    }
                }
            }
            Text(mistakes == 0 ? "零失误，一条流程线顺到底！" : "失误 \(mistakes) 次——每处填空都是一个采分点。")
                .font(.caption).foregroundColor(.secondary)
            Divider()
            HStack(alignment: .top, spacing: 6) {
                Image(systemName: "target").font(.caption).foregroundColor(.apexLava)
                Text(flow.examPoint).font(.subheadline)
            }
        }
        .padding(Spacing.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.apexStarBlue.opacity(0.1))
        .cornerRadius(Radius.card)
        .cardShadow()
    }
}
