import Foundation
import SwiftUI

// MARK: - 学生档案（移植自 PhysicsApex，主线进度交给 ProgressManager）

final class StudentProfile: ObservableObject {
    @AppStorage("profile_display_name") var displayName: String = "化学登顶者"
    @AppStorage("profile_stage") private var stageRaw: String = Stage.senior.rawValue

    var currentStage: Stage {
        get { Stage(rawValue: stageRaw) ?? .senior }
        set { stageRaw = newValue.rawValue; objectWillChange.send() }
    }

    func promote(to stage: Stage) { currentStage = stage }
}
