import SwiftUI

// MARK: - 我的：段位选择 + 数据总览 + 外观

struct ProfileView: View {
    @EnvironmentObject var profile: StudentProfile
    @EnvironmentObject var progress: ProgressManager
    @ObservedObject private var appearance = AppearanceManager.shared

    var body: some View {
        List {
            Section {
                ForEach(Stage.allCases) { stage in
                    Button {
                        profile.promote(to: stage)
                    } label: {
                        HStack(spacing: Spacing.md) {
                            Text(stage.emoji).font(.title2)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(stage.title).font(AppFont.cardTitle).foregroundColor(.primary)
                                Text(stage.subtitle).font(.caption).foregroundColor(.secondary)
                            }
                            Spacer()
                            if profile.currentStage == stage {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(stage.color)
                            }
                        }
                        .padding(.vertical, 2)
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                Text("我的段位")
            } footer: {
                Text("段位决定元素星图的点亮范围；主线节点按顺序解锁，不受段位限制。")
            }

            Section {
                Toggle("设置高考日期", isOn: examToggle)
                if profile.examDate != nil {
                    DatePicker("高考日期", selection: examBinding, displayedComponents: .date)
                    if let days = profile.daysToExam {
                        statRow(label: "距高考", value: "\(days) 天")
                    }
                }
            } header: {
                Text("距高考倒计时")
            } footer: {
                Text("设置后首页会显示距高考天数，给冲刺一个明确的目标。")
            }

            Section("学习数据") {
                statRow(label: "主线进度", value: "\(progress.completedNodeCount)/\(MainLineData.nodes.count) 关")
                statRow(label: "累计答题", value: "\(progress.totalAttempts) 次")
                statRow(label: "累计答对", value: "\(progress.totalCorrect) 次")
                statRow(label: "连续学习", value: "\(progress.streak) 天")
                statRow(label: "已解锁武器", value: "\(progress.unlockedWeapons.count) 把")
            }

            Section("外观") {
                Picker("外观模式", selection: $appearance.preference) {
                    ForEach(AppearancePreference.allCases) { pref in
                        Label(pref.label, systemImage: pref.icon).tag(pref)
                    }
                }
            }

            Section {
                Text("ChemApex · 化学登顶 v1.0\n从初中的瓶瓶罐罐，到高考的守恒推断，再到竞赛的轨道之眼。")
                    .font(.caption).foregroundColor(.secondary)
            }
        }
        .navigationTitle("我的")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var examToggle: Binding<Bool> {
        Binding(
            get: { profile.examDate != nil },
            set: { on in
                if on {
                    // 默认设为次年 6 月 7 日（高考日）
                    if profile.examDate == nil {
                        profile.examDate = StudentProfile.defaultExamDate()
                    }
                } else {
                    profile.examDate = nil
                }
            })
    }

    private var examBinding: Binding<Date> {
        Binding(
            get: { profile.examDate ?? StudentProfile.defaultExamDate() },
            set: { profile.examDate = $0 })
    }

    private func statRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
            Spacer()
            Text(value).foregroundColor(.secondary)
        }
    }
}
