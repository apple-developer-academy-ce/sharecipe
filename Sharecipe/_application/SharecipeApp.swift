import SwiftUI
import AVFoundation

@main
struct SharecipeApp: App {
    @StateObject var audioPlayerManager = AudioPlayerManager()

    init() {
        LocalNotificationManager.shared.requestAuthorization()
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoadingView()
            }
            .environmentObject(audioPlayerManager)
        }
    }
}
