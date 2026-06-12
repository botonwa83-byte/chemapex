import SwiftUI

@main
struct ChemApexApp: App {
    @StateObject private var profile = StudentProfile()
    @StateObject private var progress = ProgressManager.shared
    @StateObject private var appearance = AppearanceManager.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(profile)
                .environmentObject(progress)
                .preferredColorScheme(appearance.colorScheme)
        }
    }
}

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            AscentPathView()
                .tabItem { Label("登顶之路", systemImage: "map") }
                .tag(0)

            LabView()
                .tabItem { Label("反应釜", systemImage: "testtube.2") }
                .tag(1)

            AtlasView()
                .tabItem { Label("元素星图", systemImage: "tablecells") }
                .tag(2)

            MoreView()
                .tabItem { Label("更多", systemImage: "ellipsis.circle") }
                .tag(3)
        }
        .tint(.apexLava)
    }
}

// MARK: - 更多

struct MoreView: View {
    @EnvironmentObject var profile: StudentProfile
    @EnvironmentObject var progress: ProgressManager

    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink { ProfileView() } label: {
                        HStack(spacing: 12) {
                            Text(profile.currentStage.emoji).font(.title)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(profile.displayName).font(.headline)
                                Text(profile.currentStage.title)
                                    .font(.caption).foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }

                Section("秒杀武器") {
                    NavigationLink { DescentView() } label: {
                        Label("守恒之眼 · 双解对决", systemImage: "eye")
                    }
                    NavigationLink { WeaponShelfView() } label: {
                        HStack {
                            Label("武器架", systemImage: "shield.lefthalf.filled")
                            Spacer()
                            Text("\(progress.unlockedWeapons.count) 把")
                                .font(AppFont.chip).foregroundColor(.secondary)
                        }
                    }
                }

                Section("我的练习") {
                    NavigationLink { ErrorBookView() } label: {
                        HStack {
                            Label("错题本", systemImage: "exclamationmark.triangle")
                            Spacer()
                            let count = progress.errorProblems(from: ProblemBank.all).count
                            if count > 0 {
                                Text("\(count)")
                                    .font(AppFont.chip).foregroundColor(.white)
                                    .padding(.horizontal, 7).padding(.vertical, 2)
                                    .background(Color.apexLava).clipShape(Capsule())
                            }
                        }
                    }
                }

                Section("化学发现") {
                    NavigationLink { GiantsView() } label: {
                        Label("化学巨人", systemImage: "person.3.fill")
                    }
                    NavigationLink { StoryVaultView() } label: {
                        Label("毒与火档案馆", systemImage: "books.vertical")
                    }
                }
            }
            .navigationTitle("更多")
        }
    }
}

// MARK: - 错题本

struct ErrorBookView: View {
    @EnvironmentObject var progress: ProgressManager
    private var problems: [ChemProblem] { progress.errorProblems(from: ProblemBank.all) }

    var body: some View {
        Group {
            if problems.isEmpty {
                ContentUnavailableViewCompat(
                    title: "还没有错题",
                    systemImage: "checkmark.seal",
                    description: "答错的题会自动收录，也可在做题页点 ⭐ 手动收藏。"
                )
            } else {
                List {
                    ForEach(problems) { p in
                        NavigationLink { ProblemDetailView(problem: p) } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(p.content).font(.subheadline).lineLimit(2)
                                HStack(spacing: 6) {
                                    TagChip(text: p.stage.shortTitle, color: p.stage.color)
                                    TagChip(text: p.topic.name, color: .apexStarBlue)
                                    if progress.stats(for: p.id).flagged {
                                        Image(systemName: "star.fill").font(.caption2).foregroundColor(.apexGold)
                                    }
                                }
                            }.padding(.vertical, 2)
                        }
                    }
                }
            }
        }
        .navigationTitle("错题本")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - 武器架

struct WeaponShelfView: View {
    @EnvironmentObject var progress: ProgressManager

    var body: some View {
        List {
            ForEach(Stage.allCases) { stage in
                Section("\(stage.emoji) \(stage.title)") {
                    ForEach(ChemWeapon.allCases.filter { $0.stage == stage }) { weapon in
                        weaponRow(weapon)
                    }
                }
            }
        }
        .navigationTitle("武器架")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func weaponRow(_ weapon: ChemWeapon) -> some View {
        let unlocked = progress.unlockedWeapons.contains(weapon)
        return HStack(spacing: Spacing.md) {
            Image(systemName: unlocked ? weapon.icon : "lock.fill")
                .frame(width: 28)
                .foregroundColor(unlocked ? weapon.stage.color : .secondary)
            VStack(alignment: .leading, spacing: 2) {
                Text(weapon.name).font(AppFont.cardTitle)
                    .foregroundColor(unlocked ? .primary : .secondary)
                Text(unlocked ? weapon.insight : "在登顶之路上通关对应 Boss 解锁")
                    .font(.caption).foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 2)
        .opacity(unlocked ? 1 : 0.6)
    }
}
