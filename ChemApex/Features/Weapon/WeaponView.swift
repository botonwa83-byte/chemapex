import SwiftUI

// MARK: - 武器库：方法教练的主入口
// 武器不再是「名字列表」，而是「可教学的能力」：何时用 → 怎么用 → 对决 → 练习。

struct WeaponShelfView: View {
    @EnvironmentObject var progress: ProgressManager

    /// 已配教学的武器（教学优先于解锁——方法本身就是价值）。
    private var taughtGuides: [WeaponGuide] { WeaponGuideData.all }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("每把武器都是一套可迁移的解题方法：先学会识局（什么题该用它），再学步骤，看一场降维对决，最后上靶场练。")
                    .font(.caption).foregroundColor(.secondary)

                ForEach(taughtGuides) { guide in
                    weaponCard(guide)
                }
            }
            .padding(Spacing.lg)
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("解题武器库")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func weaponCard(_ guide: WeaponGuide) -> some View {
        let weapon = guide.weapon
        let unlocked = progress.unlockedWeapons.contains(weapon)
        return NavigationLink {
            WeaponDetailView(guide: guide)
        } label: {
            HStack(spacing: Spacing.lg) {
                Image(systemName: weapon.icon)
                    .font(.title3)
                    .frame(width: 44, height: 44)
                    .background(weapon.stage.color.opacity(0.15))
                    .foregroundColor(weapon.stage.color)
                    .cornerRadius(Radius.inner)
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text(weapon.name).font(AppFont.cardTitle)
                        if unlocked {
                            Image(systemName: "checkmark.seal.fill").font(.caption2).foregroundColor(.apexGold)
                        }
                    }
                    Text(guide.tagline).font(.caption).foregroundColor(weapon.stage.color)
                    Text(weapon.insight).font(.caption2).foregroundColor(.secondary).lineLimit(2)
                }
                Spacer(minLength: 0)
                Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
            }
            .foregroundColor(.primary)
            .cardSurface(padding: Spacing.lg)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - 武器教学页：何时用 → 怎么用 → 对决 → 练习

struct WeaponDetailView: View {
    let guide: WeaponGuide
    @EnvironmentObject var progress: ProgressManager

    private var weapon: ChemWeapon { guide.weapon }
    private var exampleCase: ChemProblem? {
        guide.exampleCaseId.flatMap { DescentCases.bossCase(id: $0) }
    }
    /// 挂这把武器的练习题（排除对决例题本身）。
    private var practice: [ChemProblem] {
        ProblemBank.all.filter { $0.weapon == weapon && $0.id != guide.exampleCaseId }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                header

                // 何时用（识局）
                section(title: "何时亮出它 · 识局", icon: "scope", accent: .apexLava) {
                    ForEach(guide.whenToUse, id: \.self) { signal in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "eye").font(.caption).foregroundColor(.apexLava).padding(.top, 2)
                            Text(signal).font(.subheadline)
                        }
                    }
                }

                // 怎么用（步骤）
                section(title: "怎么用 · 方法步骤", icon: "list.number", accent: .apexEmerald) {
                    ForEach(Array(guide.steps.enumerated()), id: \.offset) { i, step in
                        HStack(alignment: .top, spacing: Spacing.sm) {
                            Text("\(i + 1)")
                                .font(AppFont.chip)
                                .frame(width: 20, height: 20)
                                .background(Circle().fill(Color.apexEmerald.opacity(0.15)))
                                .foregroundColor(.apexEmerald)
                            Text(step).font(.subheadline)
                        }
                    }
                }

                // 看对决（守恒之眼例题）
                if let boss = exampleCase, let dual = boss.dualSolution {
                    SectionHeader(title: "看一场降维对决", systemImage: "eye", accent: .apexMystery)
                    NavigationLink {
                        DescentDetailView(problem: boss, dual: dual)
                    } label: {
                        duelCard(boss, dual: dual)
                    }
                    .buttonStyle(.plain)
                }

                // 去练习（靶场）
                if !practice.isEmpty {
                    SectionHeader(title: "上靶场 · \(practice.count) 道实战", systemImage: "target", accent: .apexStarBlue)
                    ForEach(practice) { p in
                        NavigationLink { ProblemDetailView(problem: p) } label: {
                            practiceRow(p)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(Spacing.lg)
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle(weapon.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack(spacing: Spacing.md) {
                Image(systemName: weapon.icon)
                    .font(.title)
                    .frame(width: 54, height: 54)
                    .background(weapon.stage.color.opacity(0.15))
                    .foregroundColor(weapon.stage.color)
                    .cornerRadius(Radius.inner)
                VStack(alignment: .leading, spacing: 4) {
                    Text(weapon.name).font(.title2.bold())
                    Text(guide.tagline).font(.subheadline).foregroundColor(weapon.stage.color)
                }
            }
            Text(weapon.insight).font(.subheadline).foregroundColor(.secondary)
        }
        .cardSurface(padding: Spacing.lg)
    }

    private func section<Content: View>(title: String, icon: String, accent: Color,
                                        @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            SectionHeader(title: title, systemImage: icon, accent: accent)
            content()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardSurface(padding: Spacing.lg)
    }

    private func duelCard(_ boss: ChemProblem, dual: DualSolution) -> some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack {
                Text("⚔️ 例题对决").font(AppFont.cardTitle)
                Spacer()
                TagChip(text: String(format: "快 %.0f 倍", dual.timeRatio), color: .apexMystery)
            }
            Text(boss.content).font(.caption).foregroundColor(.secondary).lineLimit(3)
            Text(dual.keyInsight).font(.caption).foregroundColor(.apexMystery)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.lg)
        .background(Color.mysteryBackground)
        .cornerRadius(Radius.card)
        .cardShadow()
    }

    private func practiceRow(_ p: ChemProblem) -> some View {
        HStack(spacing: Spacing.md) {
            Image(systemName: progress.stats(for: p.id).everCorrect ? "checkmark.circle.fill" : "circle")
                .foregroundColor(progress.stats(for: p.id).everCorrect ? .apexEmerald : .secondary)
            Text(p.content).font(.subheadline).foregroundColor(.primary).lineLimit(2)
            Spacer(minLength: 0)
            Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
        }
        .cardSurface(padding: Spacing.lg)
    }
}
