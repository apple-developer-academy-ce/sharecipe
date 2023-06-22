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
                    .padding(.trailing,3)
            } minimal: {
                Image(systemName: "clock")
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
            let preparationTime = context.state.instruction?.time ?? 0 // use the instruction's time
            SharedDataManager.shared.setTargetTime(minutes: preparationTime)
        }
    }
}







