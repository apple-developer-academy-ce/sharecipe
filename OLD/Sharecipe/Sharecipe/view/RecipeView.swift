import SwiftUI

struct RecipeView: View {
    var recipe: MenuItem

    var body: some View {
        ZStack {
            // You can use the 'recipe' property here.
            // For instance, you could display the recipe's name:
            Text(recipe.name)
        }
    }
}
