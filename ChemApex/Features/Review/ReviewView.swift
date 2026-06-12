import SwiftUI

// MARK: - 智能复习（艾宾浩斯间隔重复）

struct ReviewView: View {
    @ObservedObject private var scheduler = ReviewScheduler.shared

    private var due: [ChemProblem] {
        let ids = Set(scheduler.dueProblems().map(\.problemId))
        return ProblemBank.all.filter { ids.contains($0.id) }
    }
    private var upcoming: [ReviewItem] { scheduler.upcomingProblems() }

    var body: some View {
        Group {
            if scheduler.totalScheduled == 0 {
                ContentUnavailableViewCompat(
                    title: "复习计划空空如也",
                    systemImage: "brain.head.profile",
                    description: "做过的题会按艾宾浩斯曲线（1/3/7/15/30/60 天）自动排期复习。"
                )
            } else {
                List {
                    Section("今日待复习 · \(due.count)") {
                        if due.isEmpty {
                            Text("今天没有到期的题，继续保持 🎉")
                                .font(.subheadline).foregroundColor(.secondary)
                        }
                        ForEach(due) { p in
                            NavigationLink { ProblemDetailView(problem: p) } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(p.content).font(.subheadline).lineLimit(2)
                                    HStack(spacing: 6) {
                                        TagChip(text: p.topic.name, color: .apexStarBlue)
                                        if let item = scheduler.reviewItem(for: p.id) {
                                            TagChip(text: "连对 \(item.correctStreak)", color: .apexEmerald)
                                        }
                                    }
                                }.padding(.vertical, 2)
                            }
                        }
                    }
                    if !upcoming.isEmpty {
                        Section("即将复习") {
                            ForEach(upcoming.prefix(10)) { item in
                                if let p = ProblemBank.all.first(where: { $0.id == item.problemId }) {
                                    HStack {
                                        Text(p.content).font(.caption).foregroundColor(.secondary).lineLimit(1)
                                        Spacer()
                                        Text("\(item.daysUntilReview) 天后")
                                            .font(AppFont.chip).foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("智能复习")
        .navigationBarTitleDisplayMode(.inline)
    }
}
