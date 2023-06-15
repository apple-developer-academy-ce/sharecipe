import SwiftUI
import AVFoundation

@main
struct SharecipeApp: App {
    @StateObject var audioPlayerManager = AudioPlayerManager()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoadingView()
            }
            .environmentObject(audioPlayerManager)
        }
    }
}
