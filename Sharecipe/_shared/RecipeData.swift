import Foundation

struct RecipeData {
    static let cookingLevels: [CookingLevel] = [
        CookingLevel(name: "Simples", recipes: [
            Recipe(name: "Ovo Cozido", preparationTime: "5 minutes", image: "cardTemplate", level: "Simples", portion: "2 Porçòes"),
            // ...other recipes
        ]),
        CookingLevel(name: "Médio", recipes: [
            Recipe(name: "Macarrão", preparationTime: "15 minutes", image: "cardTemplate", level: "Simples", portion: "2 Porçòes"),
            // ...other recipes
        ]),
        CookingLevel(name: "Elaborado", recipes: [
            Recipe(name: "Macarronada", preparationTime: "15 minutes", image: "cardTemplate", level: "Simples", portion: "2 Porçòes"),
            // ...other recipes
        ]),
    ]
}
