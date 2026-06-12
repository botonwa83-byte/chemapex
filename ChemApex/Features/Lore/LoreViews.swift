import SwiftUI

// MARK: - 化学巨人

struct GiantsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: Spacing.lg) {
                ForEach(LoreData.giants) { giant in
                    NavigationLink {
                        GiantDetailView(giant: giant)
                    } label: {
                        HStack(spacing: Spacing.lg) {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.apexMystery)
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(giant.name).font(AppFont.cardTitle)
                                    Text(giant.era).font(.caption2).foregroundColor(.secondary)
                                }
                                Text(giant.title).font(.caption).foregroundColor(.apexMystery)
                                Text(giant.achievement).font(.caption).foregroundColor(.secondary).lineLimit(2)
                            }
                            Spacer()
                            Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
                        }
                        .foregroundColor(.primary)
                        .cardSurface(padding: Spacing.lg)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(Spacing.lg)
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle("化学巨人")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GiantDetailView: View {
    let giant: ChemGiant

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    Text(giant.name).font(.largeTitle.bold())
                    Text("\(giant.title) · \(giant.era)")
                        .font(.subheadline).foregroundColor(.apexMystery)
                    Text("“\(giant.quote)”")
                        .font(.body.italic())
                        .padding(Spacing.lg)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.mysteryPaper)
                        .cornerRadius(Radius.inner)
                }

                SectionHeader(title: "成就", systemImage: "trophy", accent: .apexGold)
                Text(giant.achievement).font(.subheadline)

                SectionHeader(title: "小传", systemImage: "book", accent: .apexStarBlue)
                Text(giant.story).font(.subheadline)

                SectionHeader(title: "巨人属性", systemImage: "chart.bar", accent: .apexMystery)
                statRow("洞察", giant.insight)
                statRow("创造", giant.creation)
                statRow("毅力", giant.grit)
                statRow("影响", giant.impact)
            }
            .padding(Spacing.lg)
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .navigationTitle(giant.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func statRow(_ label: String, _ value: Int) -> some View {
        HStack(spacing: Spacing.md) {
            Text(label).font(.caption).frame(width: 36, alignment: .leading)
            ProgressView(value: Double(value) / 100).tint(.apexMystery)
            Text("\(value)").font(AppFont.chip).foregroundColor(.secondary)
                .frame(width: 30, alignment: .trailing)
        }
    }
}

// MARK: - 毒与火档案馆

struct StoryVaultView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: Spacing.lg) {
                Text("化学史上最惊心动魄的故事——每篇结尾都钩回一个考点。")
                    .font(.caption).foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ForEach(LoreData.stories) { story in
                    NavigationLink {
                        StoryDetailView(story: story)
                    } label: {
                        HStack(spacing: Spacing.lg) {
                            Image(systemName: story.icon)
                                .font(.title2)
                                .frame(width: 44, height: 44)
                                .background(Color.apexMystery.opacity(0.12))
                                .foregroundColor(.apexMystery)
                                .cornerRadius(Radius.inner)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(story.title).font(AppFont.cardTitle)
                                Text(story.subtitle).font(.caption).foregroundColor(.secondary).lineLimit(2)
                            }
                            Spacer()
                            Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
                        }
                        .foregroundColor(.primary)
                        .cardSurface(padding: Spacing.lg)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(Spacing.lg)
        }
        .background(Color.mysteryBackground.ignoresSafeArea())
        .navigationTitle("毒与火档案馆")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StoryDetailView: View {
    let story: ChemStory

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                Text(story.subtitle).font(.subheadline).foregroundColor(.secondary)
                Text(story.body).font(.body).lineSpacing(5)

                VStack(alignment: .leading, spacing: Spacing.sm) {
                    HStack {
                        Image(systemName: "link").foregroundColor(.apexLava)
                        Text("钩回考点").font(AppFont.cardTitle)
                    }
                    Text(story.examHook).font(.subheadline)
                }
                .padding(Spacing.lg)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.apexLava.opacity(0.08))
                .cornerRadius(Radius.card)
            }
            .padding(Spacing.lg)
        }
        .background(Color.mysteryBackground.ignoresSafeArea())
        .navigationTitle(story.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
