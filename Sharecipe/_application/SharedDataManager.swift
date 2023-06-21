//
//  SharedDataManager.swift
//  Sharecipe
//
//  Created by Tales Valente on 21/06/23.
//

import Foundation
import Combine

class SharedDataManager: ObservableObject {
    static let shared = SharedDataManager()
    @Published var targetTime: Date = Date()

    private init() {}

    func setTargetTime(minutes: Int) {
        self.targetTime = Calendar.current.date(byAdding: .minute, value: minutes, to: Date())!
    }
    // this function will return the remaining time in seconds
    func remainingTime() -> Int {
        let remaining = Int(targetTime.timeIntervalSince(Date()))
        return max(0, remaining) // prevent it from returning negative values
    }
}
