//
//  SharedDataManager.swift
//  Sharecipe
//
//  Created by Tales Valente on 21/06/23.
//

import Foundation

class SharedDataManager {
    static let shared = SharedDataManager()
    var targetTime: Date = Date()

    private init() {}

    func setTargetTime(minutes: Int) {
        self.targetTime = Calendar.current.date(byAdding: .minute, value: minutes, to: Date())!
    }
}
