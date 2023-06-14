//
//  Tutorial_Widget.swift
//  Tutorial_Widget
//
//  Created by Tales Valente on 13/06/23.
//

import WidgetKit
import SwiftUI
import ActivityKit

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

    var body: some View {
        Text(context.state.startTime, style: .relative)
        Text(context.state.recipe.name)
    }
}
