import Foundation
import SwiftUI

// MARK: - 学生档案（移植自 PhysicsApex，主线进度交给 ProgressManager）

final class StudentProfile: ObservableObject {
    @AppStorage("profile_display_name") var displayName: String = "化学登顶者"
    @AppStorage("profile_stage") private var stageRaw: String = Stage.senior.rawValue
    /// 高考日期（距高考倒计时用）。存为 yyyy-MM-dd；空串表示未设置。
    @AppStorage("profile_exam_date") var examDateRaw: String = ""

    var currentStage: Stage {
        get { Stage(rawValue: stageRaw) ?? .senior }
        set { stageRaw = newValue.rawValue; objectWillChange.send() }
    }

    func promote(to stage: Stage) { currentStage = stage }

    // MARK: 距高考倒计时

    private static let dateFmt: DateFormatter = {
        let f = DateFormatter(); f.dateFormat = "yyyy-MM-dd"; return f
    }()

    var examDate: Date? {
        get { examDateRaw.isEmpty ? nil : Self.dateFmt.date(from: examDateRaw) }
        set { examDateRaw = newValue.map { Self.dateFmt.string(from: $0) } ?? ""; objectWillChange.send() }
    }

    /// 默认高考日期：今年或次年的 6 月 7 日（取最近的未来一个）。
    static func defaultExamDate() -> Date {
        let cal = Calendar.current
        let now = Date()
        let year = cal.component(.year, from: now)
        var comp = DateComponents(); comp.month = 6; comp.day = 7
        comp.year = year
        let thisYear = cal.date(from: comp) ?? now
        if thisYear >= cal.startOfDay(for: now) { return thisYear }
        comp.year = year + 1
        return cal.date(from: comp) ?? now
    }

    /// 距高考天数（未设置或已过则返回 nil）。
    var daysToExam: Int? {
        guard let exam = examDate else { return nil }
        let days = Calendar.current.dateComponents([.day], from: Calendar.current.startOfDay(for: Date()),
                                                   to: Calendar.current.startOfDay(for: exam)).day ?? 0
        return days >= 0 ? days : nil
    }
}
