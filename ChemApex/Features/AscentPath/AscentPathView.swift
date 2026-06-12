import SwiftUI

// MARK: - 登顶之路：学习主线地图（首页）
// 一条从山脚到山顶的垂直路径，节点 = 学/练/战。

struct AscentPathView: View {
    @EnvironmentObject var profile: StudentProfile
    @EnvironmentObject var progress: ProgressManager

    private var nodes: [LearningNode] { MainLineData.nodes }

    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: Spacing.lg) {
                        statusHeader

                        // 山顶在上，从山脚开始爬 → 倒序展示
                        ForEach(Array(nodes.enumerated().reversed()), id: \.element.id) { index, node in
                            if index == nodes.count - 1 {
                                summitBanner
                            }
                            NodeCard(node: node, state: progress.nodeState(node, in: nodes),
                                     progressValue: progress.nodeProgress(node))
                                .id(node.id)
                            if node.stage != nodes[max(index - 1, 0)].stage, index > 0 {
                                stageDivider(nodes[index - 1].stage)
                            }
                        }
                    }
                    .padding(.horizontal, Spacing.lg)
                    .padding(.bottom, Spacing.xxl)
                }
                .background(Color.apexBackground.ignoresSafeArea())
                .navigationTitle("登顶之路")
                .onAppear {
                    if let current = progress.currentNode(in: nodes) {
                        proxy.scrollTo(current.id, anchor: .center)
                    }
                }
            }
        }
    }

    // MARK: 今日状态

    private var statusHeader: some View {
        HStack(spacing: Spacing.lg) {
            statBlock(value: "\(progress.completedNodeCount)/\(nodes.count)", label: "主线进度", color: .apexLava)
            statBlock(value: "\(progress.streak)", label: "连续天数 🔥", color: .apexGold)
            statBlock(value: "\(progress.unlockedWeapons.count)", label: "守恒武器", color: .apexEmerald)
        }
        .cardSurface(padding: Spacing.lg)
        .padding(.top, Spacing.sm)
    }

    private func statBlock(value: String, label: String, color: Color) -> some View {
        VStack(spacing: 2) {
            Text(value).font(AppFont.bigStat(24)).foregroundColor(color)
            Text(label).font(.caption2).foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }

    private var summitBanner: some View {
        VStack(spacing: Spacing.xs) {
            Text("🏔").font(.system(size: 44))
            Text("APEX · 化学之巅").font(AppFont.cardTitle).foregroundColor(.apexMystery)
        }
        .padding(.top, Spacing.sm)
    }

    private func stageDivider(_ lowerStage: Stage) -> some View {
        HStack(spacing: Spacing.sm) {
            Rectangle().fill(lowerStage.color.opacity(0.4)).frame(height: 1)
            Text("\(lowerStage.emoji) \(lowerStage.title)")
                .font(AppFont.chip).foregroundColor(lowerStage.color)
                .fixedSize()
            Rectangle().fill(lowerStage.color.opacity(0.4)).frame(height: 1)
        }
        .padding(.vertical, Spacing.xs)
    }
}

// MARK: - 主线节点卡片

struct NodeCard: View {
    let node: LearningNode
    let state: NodeState
    let progressValue: Double

    var body: some View {
        NavigationLink {
            NodeDetailView(node: node)
        } label: {
            HStack(spacing: Spacing.lg) {
                // 序号圆环
                ZStack {
                    Circle()
                        .stroke(state == .locked ? Color.secondary.opacity(0.3) : node.stage.color, lineWidth: 3)
                        .frame(width: 46, height: 46)
                    if state == .completed {
                        Image(systemName: "checkmark").font(.headline).foregroundColor(node.stage.color)
                    } else if state == .locked {
                        Image(systemName: "lock.fill").font(.subheadline).foregroundColor(.secondary)
                    } else {
                        Text("\(node.order)").font(AppFont.bigStat(18)).foregroundColor(node.stage.color)
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(node.title)
                        .font(AppFont.cardTitle)
                        .foregroundColor(state == .locked ? .secondary : .primary)
                        .multilineTextAlignment(.leading)
                    Text(node.tagline)
                        .font(.caption).foregroundColor(.secondary)
                        .lineLimit(1)
                    HStack(spacing: 6) {
                        TagChip(text: "\(node.knowledgePoints.count) 个知识点", color: .apexStarBlue)
                        if node.bossCaseId != nil {
                            TagChip(text: "⚔️ Boss", color: .apexMystery)
                        }
                        if let weapon = node.weaponUnlocked {
                            TagChip(text: "🗝 \(weapon.name)", color: .apexGold)
                        }
                    }
                }
                Spacer(minLength: 0)

                if state == .current {
                    VStack(spacing: 2) {
                        Text("\(Int(progressValue * 100))%")
                            .font(AppFont.chip).foregroundColor(node.stage.color)
                        ProgressView(value: progressValue)
                            .frame(width: 36)
                            .tint(node.stage.color)
                    }
                }
            }
            .cardSurface(padding: Spacing.lg)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.card)
                    .stroke(state == .current ? node.stage.color : .clear, lineWidth: 2)
            )
            .opacity(state == .locked ? 0.65 : 1)
        }
        .buttonStyle(.plain)
        .disabled(state == .locked)
    }
}
