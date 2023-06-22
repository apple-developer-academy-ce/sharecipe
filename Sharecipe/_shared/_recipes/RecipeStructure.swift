//
//  RecipeStructure.swift
//  Sharecipe
//
//  Created by Tales Valente on 19/06/23.
//

import Foundation

struct Instruction: Codable, Hashable {
    let id = UUID()
    let step: String
    let time: Int
}

struct Recipe: Identifiable, Equatable, Codable, Hashable {
    let id = UUID()
    let name: String
    let cardImage: String
    let recipeImage: String
    let preparationTime: Int
    let level: String
    let portion: String
    let tools: [String]
    let ingredients: [String]
    let preparationInstructions: [Instruction]

    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
}
