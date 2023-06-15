import SwiftUI
import AVFoundation

@main
struct SharecipeApp: App {
    @StateObject var audioPlayerManager = AudioPlayerManager()
    @StateObject var workingOnRecipeManager = WorkingOnRecipeManager() //Calls Modules


    init() {
        LocalNotificationManager.shared.requestAuthorization()
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoadingView()
            }
            .environmentObject(audioPlayerManager)
            .environmentObject(workingOnRecipeManager)
        }
    }
}
