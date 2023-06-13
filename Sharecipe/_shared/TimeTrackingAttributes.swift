//
//  TimeTrackingAttributes.swift
//  poc_ widget
//
//  Created by Tales Valente on 13/06/23.
//

import Foundation
import ActivityKit


struct TimeTrackingAttributes: ActivityAttributes {
    public typealias TimeTrackingStatus = ContentState

    public struct ContentState: Codable, Hashable {
        var startTime: Date
    }
}
