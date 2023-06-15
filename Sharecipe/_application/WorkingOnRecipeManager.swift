//
//  WorkingOnRecipeManager.swift
//  Sharecipe
//
//  Created by Tales Valente on 15/06/23.
//

import Foundation

class WorkingOnRecipeManager: ObservableObject {
    @Published var isWorkingOnRecipe: Bool = false //Defines a Published Var for Global Access to be called in some view Eg -> RecipeView
}
