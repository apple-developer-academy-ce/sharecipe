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
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimeTrackingAttributes.self) { context in
            TimeTrackingWidgetView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Main")
                }
            } compactLeading: {
                Text("CL")
            } compactTrailing: {
                Text("CT")
            } minimal: {
                Text("M")
            }
        }
    }
}


struct TimeTrackingWidgetView: View {
    let context: ActivityViewContext<TimeTrackingAttributes>

    var targetTime: Date {
        let preparationTime = context.state.recipe.preparationTime
        return Calendar.current.date(byAdding: .minute, value: preparationTime, to: Date())!
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Sharecipe")
                .font(.title)
            Text("Seu preparo estará pronto em \(targetTime)")
                .font(.subheadline)
                .padding(.bottom,10)
        }
    }
}







