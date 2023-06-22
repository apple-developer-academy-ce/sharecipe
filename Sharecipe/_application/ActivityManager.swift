import Foundation
import ActivityKit

class ActivityManager {
    static let shared = ActivityManager()

    var activity: Activity<TimeTrackingAttributes>?
    var recipe: Recipe?

    func endActivity() {
        guard let activity = activity, let recipe = recipe else { return }

        let state = TimeTrackingAttributes.ContentState(recipe: recipe)
        Task {
            await activity.end(using: state, dismissalPolicy: .immediate)
        }
        self.activity = nil
        self.recipe = nil

        print ("[DEBUG / ActivityManager.swift] Removing All Live Activities\n")

    }
}
