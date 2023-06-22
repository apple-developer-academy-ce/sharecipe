import Foundation
//TIME FOR PREPARATIONS SHOULD BE IN MINUTES
struct RecipeData {
    static let cookingLevels: [CookingLevel] = [

        CookingLevel(name: "Simples", recipes: [
            Recipe(
                name: "Copo D'água com Limão",
                cardImage: "cardCopoDagua",
                recipeImage: "recipeCopoDagua",
                preparationTime: 1,
                level: "Simples",
                portion: "10 porções",
                tools: ["01 Copo", "01 Faca"],
                ingredients: ["200ml de Água", "1 Limão"],
                preparationInstructions: [
                    Instruction(step: "1. Encha o copo com água", time: 0),
                    Instruction(step: "2. Corte o limão em rodelas e bote no copo com água", time: 0),
                    Instruction(step: "3. Beba", time: 1)
                ]
            ),
            Recipe(
                name: "Ovo Cozido",
                cardImage: "cardOvocozido",
                recipeImage: "recipeOvocozido",
                preparationTime: 10,
                level: "Simples",
                portion: "1 Porção",
                tools: ["1 Panela", "1 Colher"],
                ingredients: ["1 Ovo", "500ml de Água Potável", "Sal a gosto"],
                preparationInstructions: [
                      Instruction(step: "1. Coloque água na panela", time: 0),
                      Instruction(step: "2. Aqueça até ferver.", time: 5),
                      Instruction(step: "3. Quando estiver fervendo, coloque os ovos.", time: 0),
                      Instruction(step: "4. Cozinhe por mais 5 minutos", time: 5)
                 ]

            ),
            Recipe(
                name: "Pão na Chapa",
                cardImage: "cardPaoNaChapa",
                recipeImage: "recipePaoNaChapa",
                preparationTime: 10,
                level: "Simples",
                portion: "2 porções",
                tools: ["frigideira", "espátula"],
                ingredients: ["2 fatias de pão de forma", "manteiga a gosto"],
                preparationInstructions: [
                    Instruction(step: "1. Aqueça uma frigideira em fogo médio.", time: 0),
                    Instruction(step: "2. Espalhe manteiga em uma das faces de cada fatia de pão.", time: 0),
                    Instruction(step: "3. Coloque as fatias de pão com a parte com manteiga virada para baixo na frigideira aquecida.", time: 0),
                    Instruction(step: "4. Deixe o pão tostar por cerca de 2 minutos, até ficar dourado e crocante.", time: 2),
                    Instruction(step: "5. Vire as fatias de pão com a espátula e toste o outro lado por mais 1-2 minutos.", time: 2),
                    Instruction(step: "6. Retire o pão da frigideira e sirva quente.", time: 0),
                    Instruction(step: "7. Você pode servir o Pão na Chapa acompanhado de queijo, presunto, requeijão ou outros ingredientes de sua preferência.", time: 0),
                ]
            ),
            Recipe(
                name: "Macarrão Alho e Óleo",
                cardImage: "cardMacarraoAlhoOleo",
                recipeImage: "recipeMacarraoAlhoOleo",
                preparationTime: 15,
                level: "Simples",
                portion: "4 porções",
                tools: ["panela", "escorredor", "frigideira", "colher de pau"],
                ingredients: [
                    "400g de macarrão tipo espaguete",
                    "1/2 xícara de azeite de oliva",
                    "6 dentes de alho picados",
                    "1 colher de chá de pimenta vermelha em flocos (opcional)",
                    "Sal a gosto",
                    "Queijo parmesão ralado a gosto",
                    "Salsinha picada a gosto"
                ],
                preparationInstructions: [
                    Instruction(step: "Em uma panela grande, cozinhe o macarrão em água com sal conforme as instruções da embalagem.", time: 0),
                    Instruction(step: "Escorra o macarrão cozido e reserve.", time: 0),
                    Instruction(step: "Em uma frigideira grande, aqueça o azeite de oliva em fogo médio.", time: 0),
                    Instruction(step: "Adicione o alho picado e a pimenta vermelha em flocos (se estiver usando) na frigideira e refogue por cerca de 2 minutos, até o alho ficar levemente dourado e perfumar a cozinha.", time: 2),
                    Instruction(step: "Adicione o macarrão cozido à frigideira e misture bem, envolvendo o macarrão com o azeite temperado.", time: 0),
                    Instruction(step: "Tempere com sal a gosto e continue cozinhando por mais 1-2 minutos, para que o macarrão absorva os sabores.", time: 2),
                    Instruction(step: "Retire do fogo e polvilhe queijo parmesão ralado e salsinha picada por cima.", time: 0),
                    Instruction(step: "Sirva quente e desfrute do delicioso macarrão alho e óleo!", time: 0)
                ]
            ),
            Recipe(
                name: "Cuscuz Simples",
                cardImage: "cardCuscuz",
                recipeImage: "recipeCuscuz",
                preparationTime: 30,
                level: "Simples",
                portion: "6 porções",
                tools: ["cuscuzeira", "panela", "colher de pau"],
                ingredients: [
                    "2 xícaras de fubá de milho",
                    "2 xícaras de água",
                    "1 colher de chá de sal"
                ],
                preparationInstructions: [
                    Instruction(step: "Em uma panela, aqueça a água até ferver.", time: 0),
                    Instruction(step: "Enquanto isso, em uma cuscuzeira, coloque o fubá de milho e hidrate com o sal, misturando bem.", time: 0),
                    Instruction(step: "Quando a água estiver fervendo, despeje-a lentamente na cuscuzeira, sobre o fubá hidratado, mexendo bem para incorporar.", time: 0),
                    Instruction(step: "Tampe a cuscuzeira e leve ao fogo baixo por cerca de 20 minutos, ou até que o cuscuz esteja firme e cozido.", time: 20),
                    Instruction(step: "Desligue o fogo e deixe o cuscuz descansar por alguns minutos.", time: 0),
                    Instruction(step: "Desenforme o cuscuz em um prato.", time: 0),
                    Instruction(step: "Corte em fatias e sirva quente.", time: 0),
                    Instruction(step: "O cuscuz pode ser acompanhado de manteiga, queijo, leite, café ou outros ingredientes a gosto.", time: 0)
                ]
            )
        ]),
        CookingLevel(name: "Médio", recipes: [
            Recipe(
                name: "Copo D'água com Limão",
                cardImage: "cardCopoDagua",
                recipeImage: "recipeCopoDagua",
                preparationTime: 1,
                level: "Simples",
                portion: "10 porções",
                tools: ["01 Copo", "01 Faca"],
                ingredients: ["200ml de Água", "1 Limão"],
                preparationInstructions: [
                    Instruction(step: "1. Encha o copo com água", time: 0),
                    Instruction(step: "2. Corte o limão em rodelas e bote no copo com água", time: 0),
                    Instruction(step: "3. Beba", time: 0)
                ]
            ),
            Recipe(
                name: "Bolo Fofo",
                cardImage: "cardBoloFofo",
                recipeImage: "recipeBoloFofo",
                preparationTime: 40,
                level: "Médio",
                portion: "10 porções",
                tools: ["forma de bolo", "batedeira", "espátula"],
                ingredients: [
                    "3 ovos",
                    "2 xícaras de farinha de trigo",
                    "1 e 1/2 xícara de açúcar",
                    "1 xícara de leite",
                    "1/2 xícara de óleo vegetal",
                    "1 colher de sopa de fermento em pó",
                    "1 colher de chá de essência de baunilha (opcional)",
                    "Pitada de sal"
                ],
                preparationInstructions: [
                    Instruction(step: "Pré-aqueça o forno a 180°C.", time: 0),
                    Instruction(step: "Em uma tigela, peneire a farinha de trigo e o fermento em pó.", time: 0),
                    Instruction(step: "Na batedeira, bata os ovos com o açúcar até obter uma mistura clara e fofa.", time: 0),
                    Instruction(step: "Adicione o óleo, o leite e a essência de baunilha à mistura de ovos e açúcar, e bata novamente até incorporar.", time: 0),
                    Instruction(step: "Com a batedeira em velocidade baixa, adicione aos poucos a mistura de farinha e fermento à massa líquida, batendo apenas até ficar homogêneo.", time: 0),
                    Instruction(step: "Desligue a batedeira e termine de incorporar a massa delicadamente com uma espátula, fazendo movimentos de baixo para cima.", time: 0),
                    Instruction(step: "Despeje a massa em uma forma untada e leve ao forno pré-aquecido.", time: 0),
                    Instruction(step: "Asse por cerca de 30 minutos, ou até que um palito saia limpo ao ser inserido no centro do bolo.", time: 30),
                    Instruction(step: "Retire o bolo do forno e deixe esfriar antes de desenformar.", time: 0),
                    Instruction(step: "Sirva em fatias e aproveite o delicioso bolo fofo simples!", time: 0)
                ]
            ),
            Recipe(
                name: "Panqueca com Frutas Vermelhas",
                cardImage: "cardPanquecasFrutasVer",
                recipeImage: "recipePanquecasFrutasVer",
                preparationTime: 30,
                level: "Médio",
                portion: "4 porções",
                tools: ["tigela", "batedor de arame", "frigideira antiaderente", "espátula"],
                ingredients: [
                    "1 xícara de farinha de trigo",
                    "2 colheres de sopa de açúcar",
                    "1 colher de chá de fermento em pó",
                    "1 pitada de sal",
                    "1 ovo",
                    "1 xícara de leite",
                    "2 colheres de sopa de manteiga derretida",
                    "1 colher de chá de extrato de baunilha",
                    "Frutas vermelhas frescas (morangos, framboesas, mirtilos) para servir",
                    "Mel ou maple syrup para regar"
                ],
                preparationInstructions: [
                    Instruction(step: "Em uma tigela, misture a farinha de trigo, o açúcar, o fermento em pó e o sal.", time: 0),
                    Instruction(step: "Em outra tigela, bata o ovo levemente e adicione o leite, a manteiga derretida e o extrato de baunilha. Misture bem.", time: 0),
                    Instruction(step: "Despeje a mistura líquida na tigela com os ingredientes secos e mexa até obter uma massa homogênea. Evite mexer em excesso para não deixar as panquecas pesadas.", time: 0),
                    Instruction(step: "Aqueça uma frigideira antiaderente em fogo médio e unte com um pouco de manteiga ou óleo.", time: 0),
                    Instruction(step: "Despeje aproximadamente 1/4 de xícara de massa na frigideira quente para formar cada panqueca.", time: 0),
                    Instruction(step: "Cozinhe até que bolhas comecem a se formar na superfície da panqueca e as bordas fiquem firmes, cerca de 2-3 minutos.", time: 2),
                    Instruction(step: "Vire a panqueca com uma espátula e cozinhe do outro lado por mais 1-2 minutos, até ficar dourada.", time: 2),
                    Instruction(step: "Repita o processo com o restante da massa, adicionando mais manteiga ou óleo na frigideira conforme necessário.", time: 0),
                    Instruction(step: "Sirva as panquecas com as frutas vermelhas frescas por cima e regue com mel ou maple syrup. Aproveite!", time: 0)
                ]
            ),
            Recipe(
                name: "Mousse de Chocolate",
                cardImage: "cardMousseChocolate",
                recipeImage: "recipeMousseChocolate",
                preparationTime: 30,
                level: "Médio",
                portion: "6 porções",
                tools: ["tigela", "batedeira", "espátula", "taças ou potinhos para servir", "geladeira"],
                ingredients: [
                    "200g de chocolate meio amargo",
                    "3 ovos",
                    "3 colheres de sopa de açúcar",
                    "1 colher de chá de essência de baunilha (opcional)",
                    "1 pitada de sal",
                    "1 lata de creme de leite"
                ],
                preparationInstructions: [
                    Instruction(step: "Derreta o chocolate meio amargo em banho-maria ou no micro-ondas, mexendo até ficar completamente derretido e liso. Reserve e deixe esfriar um pouco.", time: 0),
                    Instruction(step: "Separe as gemas das claras dos ovos.", time: 0),
                    Instruction(step: "Em uma tigela, bata as gemas com o açúcar até obter uma mistura clara e fofa.", time: 0),
                    Instruction(step: "Adicione a essência de baunilha (se estiver usando) e a pitada de sal à mistura de gemas e açúcar, e continue batendo até incorporar.", time: 0),
                    Instruction(step: "Adicione o chocolate derretido à mistura de gemas e açúcar, mexendo bem para incorporar.", time: 0),
                    Instruction(step: "Em outra tigela, bata as claras em neve até obter picos firmes.", time: 0),
                    Instruction(step: "Incorpore delicadamente as claras em neve à mistura de chocolate, fazendo movimentos suaves de baixo para cima até obter uma massa homogênea.", time: 0),
                    Instruction(step: "Por fim, adicione o creme de leite à mistura e misture suavemente até ficar bem incorporado.", time: 0),
                    Instruction(step: "Divida a mousse em taças ou potinhos individuais e leve à geladeira por pelo menos 4 horas, ou até que esteja bem firme.", time: 240),
                    Instruction(step: "Sirva gelado e desfrute dessa irresistível mousse de chocolate!", time: 0)
                ]
            ),
            Recipe(
                name: "Mousse de Chocolate",
                cardImage: "cardMousseChocolate",
                recipeImage: "recipeMousseChocolate",
                preparationTime: 30,
                level: "Médio",
                portion: "6 porções",
                tools: ["tigela", "batedeira", "espátula", "taças ou potinhos para servir", "geladeira"],
                ingredients: [
                    "200g de chocolate meio amargo",
                    "3 ovos",
                    "3 colheres de sopa de açúcar",
                    "1 colher de chá de essência de baunilha (opcional)",
                    "1 pitada de sal",
                    "1 lata de creme de leite"
                ],
                preparationInstructions: [
                    Instruction(step: "Derreta o chocolate meio amargo em banho-maria ou no micro-ondas, mexendo até ficar completamente derretido e liso. Reserve e deixe esfriar um pouco.", time: 0),
                    Instruction(step: "Separe as gemas das claras dos ovos.", time: 0),
                    Instruction(step: "Em uma tigela, bata as gemas com o açúcar até obter uma mistura clara e fofa.", time: 0),
                    Instruction(step: "Adicione a essência de baunilha (se estiver usando) e a pitada de sal à mistura de gemas e açúcar, e continue batendo até incorporar.", time: 0),
                    Instruction(step: "Adicione o chocolate derretido à mistura de gemas e açúcar, mexendo bem para incorporar.", time: 0),
                    Instruction(step: "Em outra tigela, bata as claras em neve até obter picos firmes.", time: 0),
                    Instruction(step: "Incorpore delicadamente as claras em neve à mistura de chocolate, fazendo movimentos suaves de baixo para cima até obter uma massa homogênea.", time: 0),
                    Instruction(step: "Por fim, adicione o creme de leite à mistura e misture suavemente até ficar bem incorporado.", time: 0),
                    Instruction(step: "Divida a mousse em taças ou potinhos individuais e leve à geladeira por pelo menos 4 horas, ou até que esteja bem firme.", time: 240),
                    Instruction(step: "Sirva gelado e desfrute dessa irresistível mousse de chocolate!", time: 0)
                ]
            )

        ]),
        CookingLevel(name: "Elaborado", recipes: [
            Recipe(
                name: "Lasanha Bolonhesa",
                cardImage: "cardLasanhaBolonhesa",
                recipeImage: "recipeLasanhaBolonhesa",
                preparationTime: 120,
                level: "Elaborado",
                portion: "8 porções",
                tools: ["panela grande", "frigideira", "assadeira", "espátula", "papel alumínio"],
                ingredients: [
                    "500g de massa de lasanha pré-cozida",
                    "500g de carne moída",
                    "1 cebola média, picada",
                    "3 dentes de alho, picados",
                    "1 cenoura grande, ralada",
                    "1 lata de molho de tomate",
                    "2 colheres de sopa de extrato de tomate",
                    "1 xícara de água",
                    "1 colher de sopa de azeite de oliva",
                    "Sal e pimenta a gosto",
                    "300g de queijo muçarela ralado",
                    "100g de queijo parmesão ralado"
                ],
                preparationInstructions: [
                    Instruction(step: "Pré-aqueça o forno a 180°C.", time: 0),
                    Instruction(step: "Em uma panela grande, aqueça o azeite de oliva e refogue a cebola e o alho até ficarem dourados.", time: 0),
                    Instruction(step: "Adicione a carne moída e cozinhe até ficar bem dourada e cozida.", time: 0),
                    Instruction(step: "Acrescente a cenoura ralada e refogue por mais alguns minutos.", time: 0),
                    Instruction(step: "Adicione o molho de tomate, o extrato de tomate e a água. Tempere com sal e pimenta a gosto. Cozinhe em fogo baixo por cerca de 30 minutos, mexendo ocasionalmente.", time: 30),
                    Instruction(step: "Em uma frigideira separada, aqueça um pouco de azeite e grelhe as folhas de massa de lasanha pré-cozida por alguns segundos de cada lado para dar uma leve tostada. Reserve.", time: 0),
                    Instruction(step: "Em uma assadeira, monte a lasanha: comece com uma camada de molho bolonhesa, seguida de uma camada de massa de lasanha, uma camada de queijo muçarela ralado e uma camada de molho bolonhesa novamente. Repita esse processo até esgotar os ingredientes, finalizando com uma camada de molho bolonhesa por cima.", time: 0),
                    Instruction(step: "Cubra a assadeira com papel alumínio e leve ao forno pré-aquecido por cerca de 40 minutos.", time: 40),
                    Instruction(step: "Retire o papel alumínio e polvilhe o queijo parmesão ralado por cima da lasanha.", time: 0),
                    Instruction(step: "Leve ao forno novamente, sem o papel alumínio, por mais 15-20 minutos, ou até que o queijo esteja dourado e borbulhante.", time: 15),
                    Instruction(step: "Retire do forno e deixe descansar por alguns minutos antes de servir. Aproveite a deliciosa lasanha bolonhesa!", time: 0)
                ]
            ),
            Recipe(
                name: "Cassoulet",
                cardImage: "cardCassoulet",
                recipeImage: "recipeCassoulet",
                preparationTime: 8*60,
                level: "Elaborado",
                portion: "8 porções",
                tools: ["panela grande", "frigideira", "assadeira", "peneira", "espátula"],
                ingredients: [
                    "500g de feijão branco",
                    "500g de carne de porco (como lombo, paleta ou pernil), cortada em cubos",
                    "4 coxas de pato confitadas",
                    "200g de linguiça defumada, cortada em rodelas",
                    "200g de bacon em cubos",
                    "1 cebola grande, picada",
                    "4 dentes de alho, picados",
                    "2 cenouras médias, cortadas em rodelas",
                    "2 tomates grandes, picados",
                    "2 folhas de louro",
                    "4 ramos de tomilho",
                    "1 litro de caldo de carne",
                    "2 colheres de sopa de azeite de oliva",
                    "Sal e pimenta a gosto"
                ],
                preparationInstructions: [
                    Instruction(step: "Deixe o feijão branco de molho em água fria por pelo menos 8 horas. Em seguida, escorra e reserve.", time: 0),
                    Instruction(step: "Em uma panela grande, aqueça o azeite de oliva e frite o bacon até ficar dourado. Retire o bacon da panela e reserve.", time: 0),
                    Instruction(step: "Na mesma panela, doure os cubos de carne de porco por todos os lados. Retire a carne da panela e reserve.", time: 0),
                    Instruction(step: "Na mesma panela, adicione a cebola, o alho, as cenouras e os tomates. Refogue por alguns minutos até ficarem macios.", time: 0),
                    Instruction(step: "Adicione o feijão branco escorrido, as folhas de louro, os ramos de tomilho e o caldo de carne à panela. Tempere com sal e pimenta a gosto.", time: 0),
                    Instruction(step: "Cozinhe em fogo baixo por aproximadamente 2 horas, ou até que o feijão esteja macio e o caldo tenha reduzido e engrossado.", time: 120),
                    Instruction(step: "Enquanto isso, pré-aqueça o forno a 180°C.", time: 0),
                    Instruction(step: "Em uma frigideira separada, aqueça um pouco de azeite e doure as coxas de pato confitadas por todos os lados. Retire da frigideira e reserve.", time: 0),
                    Instruction(step: "Em uma assadeira, monte o cassoulet: coloque uma camada de feijão cozido, seguida pelos cubos de carne de porco, as rodelas de linguiça defumada, as coxas de pato confitadas e o bacon reservado. Repita esse processo até esgotar os ingredientes, finalizando com uma camada de feijão por cima.", time: 0),
                    Instruction(step: "Cubra a assadeira com papel alumínio e leve ao forno pré-aquecido por cerca de 1 hora.", time: 60),
                    Instruction(step: "Retire o papel alumínio e deixe assar por mais 30 minutos, ou até que a parte de cima esteja dourada e crocante.", time: 30),
                    Instruction(step: "Retire do forno e deixe descansar por alguns minutos antes de servir. Aproveite o delicioso Cassoulet!", time: 0)
                ]
            ),
            Recipe(
                name: "Coq au Vin",
                cardImage: "cardCoqAuVin",
                recipeImage: "recipeCoqAuVin",
                preparationTime: 3*60,
                level: "Elaborado",
                portion: "6 porções",
                tools: ["panela grande", "frigideira", "peneira", "assadeira", "espátula", "barbante culinário"],
                ingredients: [
                    "1 frango inteiro de aproximadamente 1,5kg",
                    "200g de bacon em cubos",
                    "200g de cogumelos frescos, fatiados",
                    "20 echalotas pequenas, descascadas",
                    "3 dentes de alho, picados",
                    "750ml de vinho tinto seco",
                    "500ml de caldo de galinha",
                    "2 colheres de sopa de farinha de trigo",
                    "2 colheres de sopa de manteiga",
                    "2 colheres de sopa de azeite de oliva",
                    "2 folhas de louro",
                    "4 ramos de tomilho",
                    "Sal e pimenta a gosto"
                ],
                preparationInstructions: [
                    Instruction(step: "Corte o frango em pedaços menores, removendo a espinha dorsal e dividindo em coxas, sobrecoxas e peito. Tempere com sal e pimenta a gosto.", time: 0),
                    Instruction(step: "Em uma panela grande, aqueça o azeite e a manteiga em fogo médio-alto. Adicione o bacon e frite até ficar dourado e crocante.", time: 0),
                    Instruction(step: "Retire o bacon da panela e reserve. Na mesma panela, doure os pedaços de frango por todos os lados. Retire o frango da panela e reserve.", time: 0),
                    Instruction(step: "Na mesma panela, adicione as echalotas, os cogumelos e o alho. Refogue por alguns minutos até ficarem dourados.", time: 0),
                    Instruction(step: "Polvilhe a farinha de trigo sobre os vegetais e mexa bem para incorporar.", time: 0),
                    Instruction(step: "Adicione o vinho tinto e mexa bem, raspando o fundo da panela para soltar os sabores.", time: 0),
                    Instruction(step: "Adicione o caldo de galinha, o bacon reservado, as folhas de louro e os ramos de tomilho à panela. Tempere com sal e pimenta a gosto.", time: 0),
                    Instruction(step: "Leve a panela ao fogo baixo, tampe e cozinhe por cerca de 2 horas, ou até que o frango esteja macio e o molho tenha reduzido e engrossado.", time: 120),
                    Instruction(step: "Enquanto isso, pré-aqueça o forno a 180°C.", time: 0),
                    Instruction(step: "Após o tempo de cozimento, retire o frango e os vegetais da panela e transfira para uma assadeira.", time: 0),
                    Instruction(step: "Leve a assadeira ao forno por aproximadamente 15 minutos, apenas para dourar ligeiramente a pele do frango.", time: 15),
                    Instruction(step: "Enquanto isso, coe o molho da panela através de uma peneira, descartando os sólidos. Retorne o molho coado à panela e cozinhe por mais alguns minutos para reduzir e concentrar os sabores.", time: 0),
                    Instruction(step: "Retire o frango do forno, regue com o molho concentrado e sirva quente. Aproveite o saboroso Coq au Vin!", time: 0)
                ]
            )

        ]),
    ]
}
