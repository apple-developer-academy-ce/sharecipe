import Foundation

struct RecipeData {
    static let cookingLevels: [CookingLevel] = [
        CookingLevel(name: "Simples", recipes: [
            Recipe(
                name: "Ovo Cozido",
                cardImage: "cardOvocozido",
                recipeImage: "recipeOvocozido",
                preparationTime: "5 minutes",
                level: "Simples",
                portion: "2 Porçòes",
                tools: ["Pot", "Stove", "Bowl", "testeetstestestestr", "teste2", "tesasdasdasdte3"],
                ingredients: ["2 Eggasdasdasdass", "Water", "Salt", "masdasdasdacaxeira","pisafasdasdasdasdaba", "Pamoasdasdasdasdnha"],
                preparationInstructions: ["1. Coloque água na panela", "2. Aqueça até ferver." , "3. Quando estiver fervendo, coloque os ovos.", "4. Cozinhe por 5 Minutos"]
            ),

            // ...other recipes
        ]),
        CookingLevel(name: "Médio", recipes: [
            // ...other recipes
        ]),
        CookingLevel(name: "Elaborado", recipes: [
            // ...other recipes
        ]),
    ]
}
