//
//  Tutorial_Widget.swift
//  Tutorial_Widget
//
//  Created by Tales Valente on 13/06/23.
//

import WidgetKit
import SwiftUI
import ActivityKit
import AVFoundation

struct TimeTracker_Widget: Widget {

// Pra saber o tempo que falta é só pegar o targetTime - .now() = tempo que falta em minutos
//    var timeDifference: String {
//            let targetTime = SharedDataManager.shared.targetTime
//            let currentTime = Date()
//
//            let interval = Calendar.current.dateComponents([.hour, .minute, .second], from: currentTime, to: targetTime)
//
//            guard let hour = interval.hour, let minute = interval.minute, let second = interval.second else {
//                return "Calculating..."
//            }
//
//            return String(format: "%02d:%02d:%02d", hour, minute, second)
//        }

    var formattedTargetTime: String {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: SharedDataManager.shared.targetTime)
        }

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimeTrackingAttributes.self) { context in
            TimeTrackingWidgetView(context: context)
                //.padding(.horizontal)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    
                    VStack(alignment: .leading) {
                        Text("Flavory - Receitas em Andamento") // This is the title
                            .bold()
                        Text("Receita: \(context.state.recipe.name)")
                        Text("Seu preparo estará pronto em \(SharedDataManager.shared.targetTime)")
                    }

                }
            } compactLeading: {
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.green)
                    Text("Flavory:")

                }
            } compactTrailing: {
                Text(formattedTargetTime)
            } minimal: {
               Text("Hello There")
            }
        }
    }
}

struct TimeTrackingWidgetView: View {
    let context: ActivityViewContext<TimeTrackingAttributes>

    var body: some View {
        VStack(alignment: .leading) {
            Text("Flavory")
                .font(.title)
            Text("Receita: \(context.state.recipe.name)")
            Text("Seu preparo estará pronto em \(SharedDataManager.shared.targetTime)")
                .font(.subheadline)
                .padding(.bottom,10)
        }
        .padding()
        .onAppear {
            let preparationTime = context.state.recipe.preparationTime
            SharedDataManager.shared.setTargetTime(minutes: preparationTime)
        }
    }
}







