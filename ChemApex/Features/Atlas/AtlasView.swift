import SwiftUI

// MARK: - 图鉴 Tab：元素星图 + 方程式剧本库

struct AtlasView: View {
    @State private var mode = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Picker("图鉴", selection: $mode) {
                    Text("元素星图").tag(0)
                    Text("方程式剧本").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, Spacing.lg)
                .padding(.vertical, Spacing.sm)

                if mode == 0 {
                    ElementMapView()
                } else {
                    EquationLibraryView()
                }
            }
            .background(Color.apexBackground.ignoresSafeArea())
            .navigationTitle(mode == 0 ? "元素星图" : "方程式剧本库")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - 元素星图（前四周期完整网格 + 高频重元素行）

struct ElementMapView: View {
    @EnvironmentObject var profile: StudentProfile
    @State private var selected: Element? = nil

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: 18)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                Text("亮起的元素随段位解锁——你的星图点亮多少，就学到了多少。")
                    .font(.caption).foregroundColor(.secondary)

                // 前四周期网格（18 列）
                LazyVGrid(columns: columns, spacing: 3) {
                    ForEach(1...4, id: \.self) { period in
                        ForEach(1...18, id: \.self) { group in
                            if let e = gridElement(period: period, group: group) {
                                ElementCell(element: e, lit: isLit(e)) { selected = e }
                            } else {
                                Color.clear.frame(height: 34)
                            }
                        }
                    }
                }

                // 高频重元素
                SectionHeader(title: "高频重元素", systemImage: "star", accent: .apexGold)
                Text("第五周期以后只收高考会遇到的元素，不滥竽充数。")
                    .font(.caption2).foregroundColor(.secondary)
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 6), count: 8), spacing: 6) {
                    ForEach(ElementData.heavyElements) { e in
                        ElementCell(element: e, lit: isLit(e)) { selected = e }
                    }
                }

                legend
            }
            .padding(Spacing.lg)
        }
        .sheet(item: $selected) { e in
            ElementDetailView(element: e)
                .presentationDetents([.medium, .large])
        }
    }

    private func gridElement(period: Int, group: Int) -> Element? {
        ElementData.gridElements.first { $0.period == period && $0.group == group }
    }

    private func isLit(_ e: Element) -> Bool {
        profile.currentStage.unlocks(e.firstStage)
    }

    private var legend: some View {
        FlowLayout(spacing: 8) {
            legendDot(.alkaliLike); legendDot(.transition); legendDot(.metalloid)
            legendDot(.nonmetal); legendDot(.halogen); legendDot(.nobleGas)
        }
    }

    private func legendDot(_ c: ElementCategory) -> some View {
        HStack(spacing: 4) {
            Circle().fill(c.color).frame(width: 8, height: 8)
            Text(c.name).font(.caption2).foregroundColor(.secondary)
        }
    }
}

// MARK: - 元素格子

struct ElementCell: View {
    let element: Element
    let lit: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 0) {
                Text(element.symbol)
                    .font(.system(size: 11, weight: .bold))
                Text(element.name)
                    .font(.system(size: 8))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 34)
            .background(cellColor)
            .foregroundColor(lit ? .white : .secondary)
            .cornerRadius(4)
            .overlay(alignment: .topTrailing) {
                if element.examHeat >= 3, lit {
                    Circle().fill(Color.apexGold).frame(width: 5, height: 5)
                        .padding(2)
                }
            }
        }
        .buttonStyle(.plain)
    }

    private var cellColor: Color {
        guard lit else { return Color.secondary.opacity(0.12) }
        // 考点热度决定亮度：必考元素烧得最亮
        let opacity = [0.30, 0.50, 0.72, 1.0][min(element.examHeat, 3)]
        return element.category.color.opacity(opacity)
    }
}

// MARK: - 元素详情卡

struct ElementDetailView: View {
    let element: Element

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                HStack(alignment: .top, spacing: Spacing.lg) {
                    VStack(spacing: 2) {
                        Text("\(element.number)").font(.caption).foregroundColor(.secondary)
                        Text(element.symbol).font(.system(size: 44, weight: .bold))
                        Text(element.name).font(.headline)
                    }
                    .frame(width: 90, height: 110)
                    .background(element.category.color.opacity(0.15))
                    .cornerRadius(Radius.inner)

                    VStack(alignment: .leading, spacing: 6) {
                        TagChip(text: element.category.name, color: element.category.color)
                        Text("第 \(element.period) 周期 · 第 \(element.group) 列")
                            .font(.caption).foregroundColor(.secondary)
                        if element.examHeat > 0 {
                            HStack(spacing: 2) {
                                Text("考点热度").font(.caption).foregroundColor(.secondary)
                                ForEach(0..<element.examHeat, id: \.self) { _ in
                                    Image(systemName: "flame.fill").font(.caption2).foregroundColor(.apexLava)
                                }
                            }
                        }
                        if let flame = element.flameColor {
                            Text("焰色：\(flame)").font(.caption).foregroundColor(.apexGold)
                        }
                    }
                    Spacer()
                }

                if !element.examPoints.isEmpty {
                    SectionHeader(title: "高考考点", systemImage: "target", accent: .apexLava)
                    ForEach(element.examPoints, id: \.self) { point in
                        HStack(alignment: .top, spacing: 6) {
                            Circle().fill(Color.apexLava).frame(width: 6, height: 6).padding(.top, 6)
                            Text(point).font(.subheadline)
                        }
                    }
                }

                if !element.pitfalls.isEmpty {
                    SectionHeader(title: "易错警示", systemImage: "exclamationmark.triangle", accent: .apexDanger)
                    ForEach(element.pitfalls, id: \.self) { pit in
                        Text(pit).font(.subheadline).foregroundColor(.apexDanger)
                            .padding(Spacing.sm)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.apexDanger.opacity(0.08))
                            .cornerRadius(Radius.inner)
                    }
                }
            }
            .padding(Spacing.xl)
        }
        .background(Color.apexBackground.ignoresSafeArea())
    }
}
