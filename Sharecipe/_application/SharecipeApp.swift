//
//  SharecipeApp.swift
//  Sharecipe
//
//  Created by Tales Valente on 06/06/23.
//

import SwiftUI

@main
struct SharecipeApp: App {
    var body: some Scene {
        //let menuItem = MenuItem(name: "Recipe Name")

        WindowGroup {
            NavigationStack {
                //RecipeView(recipe: menuItem)
                LoadingView()
            }
        }
    }
}
