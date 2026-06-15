import SwiftUI

// MARK: - 虚拟实验台：关卡列表

struct LabBenchView: View {
    @ObservedObject private var manager = LabBenchManager.shared
    @ObservedObject private var purchase = PurchaseManager.shared
    @State private var showPaywall = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("按「发生 → 除杂 → 干燥 → 收集 → 尾气」拼装置链。选错的卡会当场告诉你为什么不行——错误本身就是考点。")
                    .font(.caption).foregroundColor(.secondary)

                ForEach(Array(LabBenchData.all.enumerated()), id: \.element.id) { index, setup in
                    setupRow(setup, premiumLocked: purchase.isLabPremiumLocked(index: index))
                }
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("虚拟实验台")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showPaywall) { PaywallView() }
    }

    @ViewBuilder
    private func setupRow(_ setup: LabSetup, premiumLocked: Bool) -> some View {
        if premiumLocked {
            Button { showPaywall = true } label: { setupLabel(setup, premiumLocked: true) }
                .buttonStyle(.plain)
        } else {
            NavigationLink { LabBenchGameView(setup: setup) } label: { setupLabel(setup, premiumLocked: false) }
                .buttonStyle(.plain)
        }
    }

    private func setupLabel(_ setup: LabSetup, premiumLocked: Bool) -> some View {
        let stars = manager.bestStars[setup.id] ?? 0
        return HStack(spacing: Spacing.lg) {
            Image(systemName: premiumLocked ? "crown.fill" : "flask")
                .font(.title3)
                .frame(width: 40, height: 40)
                .background(Color.apexEmerald.opacity(0.12))
                .foregroundColor(premiumLocked ? .apexGold : .apexEmerald)
                .cornerRadius(Radius.inner)
            VStack(alignment: .leading, spacing: 4) {
                Text(setup.title).font(AppFont.cardTitle)
                HStack(spacing: 6) {
                    TagChip(text: setup.stage.shortTitle, color: setup.stage.color)
                    TagChip(text: "\(setup.slots.count) 个环节", color: .apexEmerald)
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

// MARK: - 拼装现场

struct LabBenchGameView: View {
    let setup: LabSetup
    @ObservedObject private var manager = LabBenchManager.shared

    @State private var filled: [String] = []          // 已填入的 cardId（按槽顺序）
    @State private var mistakes = 0
    @State private var feedback: String? = nil        // 选错时的化学理由
    @State private var shuffledPool: [ApparatusCard] = []

    private var done: Bool { filled.count == setup.slots.count }
    private var currentSlot: LabSlot? { done ? nil : setup.slots[filled.count] }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                Text(setup.targetDescription)
                    .font(.subheadline).foregroundColor(.secondary)

                // 装置链
                SectionHeader(title: "装置链", systemImage: "link", accent: .apexEmerald)
                ForEach(Array(setup.slots.enumerated()), id: \.element.id) { index, slot in
                    slotRow(slot, index: index)
                }

                // 错误反馈
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

                if done {
                    successCard
                } else {
                    // 仪器卡池
                    SectionHeader(title: "仪器台 · 为「\(currentSlot?.role ?? "")」选一件", systemImage: "tray.full", accent: .apexStarBlue)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: Spacing.md) {
                        ForEach(shuffledPool.filter { !filled.contains($0.id) }) { card in
                            poolCard(card)
                        }
                    }
                }
            }
            .padding(Spacing.lg)
            .readableWidth()
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle(setup.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if shuffledPool.isEmpty { shuffledPool = setup.pool.shuffled() }
        }
    }

    // MARK: 逻辑

    private func pick(_ card: ApparatusCard) {
        guard let slot = currentSlot else { return }
        if card.id == slot.correctCardId {
            withAnimation {
                filled.append(card.id)
                feedback = nil
            }
            if done {
                manager.record(setupId: setup.id, stars: LabBenchManager.stars(mistakes: mistakes))
            }
        } else {
            mistakes += 1
            withAnimation {
                if let reason = setup.rejections[card.id] {
                    feedback = reason
                } else if let laterSlot = setup.slots.first(where: { $0.correctCardId == card.id }) {
                    feedback = "装置没错，但顺序不对——它属于「\(laterSlot.role)」环节，先把当前环节搭好。"
                } else {
                    feedback = "这一步用不上它，再想想「\(slot.role)」需要什么。"
                }
            }
        }
    }

    // MARK: 组件

    private func slotRow(_ slot: LabSlot, index: Int) -> some View {
        let isFilled = index < filled.count
        let isCurrent = index == filled.count
        let card = setup.pool.first { $0.id == slot.correctCardId }

        return VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack(spacing: Spacing.md) {
                Text("\(index + 1)")
                    .font(AppFont.chip)
                    .frame(width: 22, height: 22)
                    .background(Circle().fill(isFilled ? Color.apexEmerald : Color.secondary.opacity(0.15)))
                    .foregroundColor(isFilled ? .white : .secondary)
                Text(slot.role).font(AppFont.cardTitle)
                Spacer()
                if isFilled {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.apexEmerald)
                } else if isCurrent {
                    TagChip(text: "进行中", color: .apexLava)
                }
            }
            if isFilled, let card {
                HStack(spacing: Spacing.sm) {
                    Image(systemName: card.icon).font(.caption).foregroundColor(.apexEmerald)
                    Text(card.name).font(.caption).fontWeight(.medium)
                }
                Text(slot.successNote).font(.caption).foregroundColor(.secondary)
            } else {
                Text(isCurrent ? "从下方仪器台选择…" : "等待上一环节")
                    .font(.caption).foregroundColor(.secondary.opacity(0.6))
            }
        }
        .cardSurface(padding: Spacing.lg)
        .overlay(
            RoundedRectangle(cornerRadius: Radius.card)
                .stroke(isCurrent ? Color.apexLava : .clear, lineWidth: 2)
        )
    }

    private func poolCard(_ card: ApparatusCard) -> some View {
        Button { pick(card) } label: {
            VStack(spacing: 6) {
                Image(systemName: card.icon).font(.title3).foregroundColor(.apexStarBlue)
                Text(card.name).font(.caption).fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text(card.detail).font(.caption2).foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity)
            .padding(Spacing.md)
            .background(Color.apexCardSurface)
            .cornerRadius(Radius.inner)
            .cardShadow()
        }
        .buttonStyle(.plain)
    }

    private var successCard: some View {
        let stars = LabBenchManager.stars(mistakes: mistakes)
        return VStack(alignment: .leading, spacing: Spacing.md) {
            HStack {
                Text("⚗️ 装置链搭建成功").font(.headline)
                Spacer()
                HStack(spacing: 2) {
                    ForEach(0..<3, id: \.self) { i in
                        Image(systemName: i < stars ? "star.fill" : "star")
                            .foregroundColor(.apexGold)
                    }
                }
            }
            Text(mistakes == 0 ? "零失误，一条链顺到底！" : "失误 \(mistakes) 次——每条错误理由都是一个考点。")
                .font(.caption).foregroundColor(.secondary)
            Divider()
            HStack(alignment: .top, spacing: 6) {
                Image(systemName: "target").font(.caption).foregroundColor(.apexLava)
                Text(setup.examPoint).font(.subheadline)
            }
        }
        .padding(Spacing.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.apexEmerald.opacity(0.1))
        .cornerRadius(Radius.card)
        .cardShadow()
    }
}
