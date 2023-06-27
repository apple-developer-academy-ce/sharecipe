import SwiftUI
import AVFoundation

@main
struct SharecipeApp: App {

    //TODO: FAZ SENTIDO? POR QUE NÃO COLOCA TUDO DENTRO DE SHAREDDATAMANAGER?
    @StateObject var workingOnRecipeManager = WorkingOnRecipeManager() //Calls Modules

    init() {
        LocalNotificationManager.shared.requestAuthorization()
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoadingView()
                
            }
            .environmentObject(workingOnRecipeManager)
        }
    }
}
