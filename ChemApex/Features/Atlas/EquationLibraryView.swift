import SwiftUI

// MARK: - 方程式剧本库：条件 + 现象 + 考点 + 陷阱

struct EquationLibraryView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("方程式不是公式，是剧本：什么条件、什么现象、坑在哪里。")
                    .font(.caption).foregroundColor(.secondary)

                ForEach(Stage.allCases) { stage in
                    let eqs = EquationLibrary.all.filter { $0.stage == stage }
                    if !eqs.isEmpty {
                        SectionHeader(title: "\(stage.emoji) \(stage.shortTitle)篇", accent: stage.color)
                        ForEach(eqs) { eq in
                            EquationCard(equation: eq)
                        }
                    }
                }
            }
            .padding(Spacing.lg)
        }
    }
}

struct EquationCard: View {
    let equation: ChemEquation
    @State private var expanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) { expanded.toggle() }
            } label: {
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        TagChip(text: equation.condition, color: .apexGold)
                        TagChip(text: equation.topic.name, color: .apexStarBlue)
                        Spacer()
                        if equation.trap != nil {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.caption).foregroundColor(.apexDanger)
                        }
                        Image(systemName: expanded ? "chevron.up" : "chevron.down")
                            .font(.caption).foregroundColor(.secondary)
                    }
                    Text(equation.formula)
                        .font(.system(.subheadline, design: .monospaced).weight(.semibold))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                }
            }
            .buttonStyle(.plain)

            if expanded {
                detailRow(icon: "eye", label: "现象", text: equation.phenomenon, color: .apexStarBlue)
                detailRow(icon: "target", label: "考点", text: equation.examPoint, color: .apexLava)
                if let ionic = equation.ionic {
                    detailRow(icon: "drop", label: "离子方程式", text: ionic, color: .apexEmerald)
                }
                if let trap = equation.trap {
                    HStack(alignment: .top, spacing: 6) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.caption).foregroundColor(.apexDanger)
                        Text(trap).font(.caption).foregroundColor(.apexDanger)
                    }
                    .padding(Spacing.sm)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.apexDanger.opacity(0.08))
                    .cornerRadius(Radius.inner)
                }
            }
        }
        .cardSurface(padding: Spacing.lg)
    }

    private func detailRow(icon: String, label: String, text: String, color: Color) -> some View {
        HStack(alignment: .top, spacing: 6) {
            Image(systemName: icon).font(.caption).foregroundColor(color).frame(width: 16)
            VStack(alignment: .leading, spacing: 2) {
                Text(label).font(AppFont.chip).foregroundColor(color)
                Text(text).font(.caption).foregroundColor(.primary.opacity(0.85))
            }
        }
    }
}
