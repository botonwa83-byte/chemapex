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
    // 截图/UI 自动化用启动参数：-demoDetective 化学神探案件；-demoFlashcards 现象闪卡对战
    @State private var demoDetective = ProcessInfo.processInfo.arguments.contains("-demoDetective")
    @State private var demoFlashcards = ProcessInfo.processInfo.arguments.contains("-demoFlashcards")
    @State private var demoPaywall = ProcessInfo.processInfo.arguments.contains("-demoPaywall")
    @State private var demoLabBench = ProcessInfo.processInfo.arguments.contains("-demoLabBench")
    @State private var demoProcess = ProcessInfo.processInfo.arguments.contains("-demoProcess")

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
        .fullScreenCover(isPresented: $demoDetective) {
            if let first = DetectiveData.all.first {
                NavigationStack { DetectiveCaseView(detectiveCase: first) }
            }
        }
        .fullScreenCover(isPresented: $demoFlashcards) {
            NavigationStack { FlashcardGameView(category: .flame) }
        }
        .sheet(isPresented: $demoPaywall) { PaywallView() }
        .fullScreenCover(isPresented: $demoLabBench) {
            if let first = LabBenchData.all.first {
                NavigationStack { LabBenchGameView(setup: first) }
            }
        }
        .fullScreenCover(isPresented: $demoProcess) {
            if let first = ProcessFlowData.all.first {
                NavigationStack { ProcessFlowDetailView(flow: first) }
            }
        }
    }
}

// MARK: - 更多

struct MoreView: View {
    @EnvironmentObject var profile: StudentProfile
    @EnvironmentObject var progress: ProgressManager
    @ObservedObject private var purchase = PurchaseManager.shared
    @State private var showPaywall = false

    var body: some View {
        NavigationStack {
            List {
                if !purchase.isUnlocked {
                    Section {
                        Button { showPaywall = true } label: {
                            HStack(spacing: 12) {
                                Image(systemName: "crown.fill")
                                    .font(.title3).foregroundColor(.apexGold)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("解锁完整版").font(.headline).foregroundColor(.primary)
                                    Text("主线全部 \(MainLineData.nodes.count) 关 · 战例 · 神探，一次买断")
                                        .font(.caption).foregroundColor(.secondary)
                                }
                                Spacer()
                                Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }

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
                    NavigationLink { DetectiveView() } label: {
                        HStack {
                            Label("化学神探 · 推断破案", systemImage: "magnifyingglass")
                            Spacer()
                            Text("\(DetectiveManager.shared.solvedCount)/\(DetectiveData.all.count)")
                                .font(AppFont.chip).foregroundColor(.secondary)
                        }
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
                    NavigationLink { ReviewView() } label: {
                        HStack {
                            Label("智能复习", systemImage: "brain.head.profile")
                            Spacer()
                            if ReviewScheduler.shared.dueCount > 0 {
                                Text("\(ReviewScheduler.shared.dueCount)")
                                    .font(AppFont.chip).foregroundColor(.white)
                                    .padding(.horizontal, 7).padding(.vertical, 2)
                                    .background(Color.apexLava).clipShape(Capsule())
                            }
                        }
                    }
                    NavigationLink { FlashcardView() } label: {
                        Label("现象闪卡 · 颜色快答", systemImage: "paintpalette")
                    }
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
            .sheet(isPresented: $showPaywall) { PaywallView() }
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
