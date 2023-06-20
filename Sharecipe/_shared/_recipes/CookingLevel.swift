//
//  CookingLevel.swift
//  Sharecipe
//
//  Created by Tales Valente on 19/06/23.
//

import Foundation
import SwiftUI

struct CookingLevel: Identifiable, Equatable, Codable, Hashable {
    let id = UUID()
    let name: String
    let recipes: [Recipe]

    static func == (lhs: CookingLevel, rhs: CookingLevel) -> Bool {
        return lhs.id == rhs.id
    }
}
