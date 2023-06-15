import Foundation

struct RecipeData {
    static let cookingLevels: [CookingLevel] = [
        CookingLevel(name: "Simples", recipes: [
            Recipe(
                name: "Ovo Cozido",
                cardImage: "cardOvocozido",
                recipeImage: "recipeOvocozido",
                preparationTime: 1,
                level: "Simples",
                portion: "2 Porçòes",
                tools: ["Pot", "Stove", "Bowl", "testeetstestestestr", "teste2", "tesasdasdasdte3"],
                ingredients: ["2 Eggasdasdasdass", "Water", "Salt", "masdasdasdacaxeira","pisafasdasdasdasdaba", "Pamoasdasdasdasdnha"],
                preparationInstructions: ["1. Coloque água na panela", "2. Aqueça até ferver." , "3. Quando estiver fervendo, coloque os ovos.", "4. Cozinhe por 5 Minutos"]
            ),




//            //GPT, me dê receitas preenchendo os campos entre pareteses. A explicação de cada atributo estará ao lado
//            Recipe(
//                name: "", // Nome da Receita
//                cardImage: "cardImage", //não precisa preencher
//                recipeImage: "recipeImage", //não precisa preencher
//                preparationTime: "", //Tempo de preparo
//                level: "", //Nível de dificuldade: Simples, Médio ou Elaborado
//                portion: "", //Quantidade de porções
//                tools: ["","","",""], //Ferramentas ou Utensilios Necessários
//                ingredients: ["","","","",], //Ingredientes
//                preparationInstrutions: ["","","","","",] //instruções de preparo
//
//            )

            // ...other recipes
        ]),
        CookingLevel(name: "Médio", recipes: [
            Recipe(
                name: "Risoto de Camarão",
                cardImage: "cardImage",
                recipeImage: "recipeImage",
                preparationTime: 1,
                level: "Médio",
                portion: "4 porções",
                tools: [
                    "Panela de pressão",
                    "Faca",
                    "Tábua de cortar",
                    "Colher de pau"
                ],
                ingredients: [
                    "2 xícaras de arroz arbóreo",
                    "400g de camarão limpo",
                    "1 cebola média picada",
                    "3 dentes de alho picados",
                    "1 copo de vinho branco seco",
                    "1 litro de caldo de legumes",
                    "100g de manteiga",
                    "50g de queijo parmesão ralado",
                    "Sal e pimenta a gosto",
                    "Salsinha picada para decorar"
                ],
                preparationInstructions: [
                    "Em uma panela de pressão, derreta metade da manteiga e refogue a cebola até ficar transparente.",
                    "Adicione o alho e refogue até dourar.",
                    "Adicione o arroz e refogue até ficar translúcido.",
                    "Despeje o vinho branco e mexa até evaporar.",
                    "Acrescente o caldo de legumes, o sal e a pimenta. Feche a panela e cozinhe por 5 minutos após pegar pressão.",
                    "Libere a pressão, abra a panela e adicione o camarão. Cozinhe em fogo baixo até o camarão ficar rosa.",
                    "Desligue o fogo, adicione a manteiga restante e o queijo parmesão. Mexa até incorporar bem.",
                    "Sirva quente, decorado com salsinha picada."
                ]
            ),
        ]),
        CookingLevel(name: "Elaborado", recipes: [
            // ...other recipes
        ]),
    ]
}
