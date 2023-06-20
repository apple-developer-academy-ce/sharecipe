import Foundation

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
                preparationInstructions: ["Encha o copo com água", "Corte o limão em rodelas e bote no copo com água", "Beba"]
            ),
            Recipe(
                name: "Ovo Cozido",
                cardImage: "cardOvocozido",
                recipeImage: "recipeOvocozido",
                preparationTime: 5,
                level: "Simples",
                portion: "1 Porção",
                tools: ["1 Panela", "1 Colher"],
                ingredients: ["1 Ovo", "500ml de Água Potável", "Sal a gosto"],
                preparationInstructions: ["1. Coloque água na panela", "2. Aqueça até ferver." , "3. Quando estiver fervendo, coloque os ovos.", "4. Cozinhe por 5 Minutos"]
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
                preparationInstructions: ["Aqueça uma frigideira em fogo médio.", "Espalhe manteiga em uma das faces de cada fatia de pão.", "Coloque as fatias de pão com a parte com manteiga virada para baixo na frigideira aquecida.", "Deixe o pão tostar por cerca de 2 minutos, até ficar dourado e crocante.", "Vire as fatias de pão com a espátula e toste o outro lado por mais 1-2 minutos.", "Retire o pão da frigideira e sirva quente.", "Você pode servir o Pão na Chapa acompanhado de queijo, presunto, requeijão ou outros ingredientes de sua preferência."]
            ),
            Recipe(
                name: "Macarrão Alho e Óleo",
                cardImage: "cardMacarraoAlhoOleo",
                recipeImage: "recipeMacarraoAlhoOleo",
                preparationTime: 15,
                level: "Simples",
                portion: "4 porções",
                tools: ["panela", "escorredor", "frigideira", "colher de pau"],
                ingredients: ["400g de macarrão tipo espaguete", "1/2 xícara de azeite de oliva", "6 dentes de alho picados", "1 colher de chá de pimenta vermelha em flocos (opcional)", "Sal a gosto", "Queijo parmesão ralado a gosto", "Salsinha picada a gosto"],
                preparationInstructions: ["Em uma panela grande, cozinhe o macarrão em água com sal conforme as instruções da embalagem.", "Escorra o macarrão cozido e reserve.", "Em uma frigideira grande, aqueça o azeite de oliva em fogo médio.", "Adicione o alho picado e a pimenta vermelha em flocos (se estiver usando) na frigideira e refogue por cerca de 2 minutos, até o alho ficar levemente dourado e perfumar a cozinha.", "Adicione o macarrão cozido à frigideira e misture bem, envolvendo o macarrão com o azeite temperado.", "Tempere com sal a gosto e continue cozinhando por mais 1-2 minutos, para que o macarrão absorva os sabores.", "Retire do fogo e polvilhe queijo parmesão ralado e salsinha picada por cima.", "Sirva quente e desfrute do delicioso macarrão alho e óleo!"]
            ),
            Recipe(
                name: "Cuscuz Simples",
                cardImage: "cardCuscuz",
                recipeImage: "recipeCuscuz",
                preparationTime: 30,
                level: "Simples",
                portion: "6 porções",
                tools: ["cuscuzeira", "panela", "colher de pau"],
                ingredients: ["2 xícaras de fubá de milho", "2 xícaras de água", "1 colher de chá de sal"],
                preparationInstructions: ["Em uma panela, aqueça a água até ferver.", "Enquanto isso, em uma cuscuzeira, coloque o fubá de milho e hidrate com o sal, misturando bem.", "Quando a água estiver fervendo, despeje-a lentamente na cuscuzeira, sobre o fubá hidratado, mexendo bem para incorporar.", "Tampe a cuscuzeira e leve ao fogo baixo por cerca de 20 minutos, ou até que o cuscuz esteja firme e cozido.", "Desligue o fogo e deixe o cuscuz descansar por alguns minutos.", "Desenforme o cuscuz em um prato.", "Corte em fatias e sirva quente.", "O cuscuz pode ser acompanhado de manteiga, queijo, leite, café ou outros ingredientes a gosto."]
            )
        ]),

        CookingLevel(name: "Médio", recipes: [

            Recipe(
                name: "Bolo Fofo",
                cardImage: "cardBoloFofo",
                recipeImage: "recipeBoloFofo",
                preparationTime: 40,
                level: "Médio",
                portion: "10 porções",
                tools: ["forma de bolo", "batedeira", "espátula"],
                ingredients: ["3 ovos", "2 xícaras de farinha de trigo", "1 e 1/2 xícara de açúcar", "1 xícara de leite", "1/2 xícara de óleo vegetal", "1 colher de sopa de fermento em pó", "1 colher de chá de essência de baunilha (opcional)", "Pitada de sal"],
                preparationInstructions: ["Pré-aqueça o forno a 180°C.", "Em uma tigela, peneire a farinha de trigo e o fermento em pó.", "Na batedeira, bata os ovos com o açúcar até obter uma mistura clara e fofa.", "Adicione o óleo, o leite e a essência de baunilha à mistura de ovos e açúcar, e bata novamente até incorporar.", "Com a batedeira em velocidade baixa, adicione aos poucos a mistura de farinha e fermento à massa líquida, batendo apenas até ficar homogêneo.", "Desligue a batedeira e termine de incorporar a massa delicadamente com uma espátula, fazendo movimentos de baixo para cima.", "Despeje a massa em uma forma untada e leve ao forno pré-aquecido.", "Asse por cerca de 30 minutos, ou até que um palito saia limpo ao ser inserido no centro do bolo.", "Retire o bolo do forno e deixe esfriar antes de desenformar.", "Sirva em fatias e aproveite o delicioso bolo fofo simples!"]
            ),
            Recipe(
                name: "Panqueca com Frutas Vermelhas",
                cardImage: "cardPanquecasFrutasVer",
                recipeImage: "recipePanquecasFrutasVer",
                preparationTime: 30,
                level: "Médio",
                portion: "4 porções",
                tools: ["tigela", "batedor de arame", "frigideira antiaderente", "espátula"],
                ingredients: ["1 xícara de farinha de trigo", "2 colheres de sopa de açúcar", "1 colher de chá de fermento em pó", "1 pitada de sal", "1 ovo", "1 xícara de leite", "2 colheres de sopa de manteiga derretida", "1 colher de chá de extrato de baunilha", "Frutas vermelhas frescas (morangos, framboesas, mirtilos) para servir", "Mel ou maple syrup para regar"],
                preparationInstructions: ["Em uma tigela, misture a farinha de trigo, o açúcar, o fermento em pó e o sal.", "Em outra tigela, bata o ovo levemente e adicione o leite, a manteiga derretida e o extrato de baunilha. Misture bem.", "Despeje a mistura líquida na tigela com os ingredientes secos e mexa até obter uma massa homogênea. Evite mexer em excesso para não deixar as panquecas pesadas.", "Aqueça uma frigideira antiaderente em fogo médio e unte com um pouco de manteiga ou óleo.", "Despeje aproximadamente 1/4 de xícara de massa na frigideira quente para formar cada panqueca.", "Cozinhe até que bolhas comecem a se formar na superfície da panqueca e as bordas fiquem firmes, cerca de 2-3 minutos.", "Vire a panqueca com uma espátula e cozinhe do outro lado por mais 1-2 minutos, até ficar dourada.", "Repita o processo com o restante da massa, adicionando mais manteiga ou óleo na frigideira conforme necessário.", "Sirva as panquecas com as frutas vermelhas frescas por cima e regue com mel ou maple syrup. Aproveite!"]
            ),

            Recipe(
                name: "Mousse de Chocolate",
                cardImage: "cardMousseChocolate",
                recipeImage: "recipeMousseChocolate",
                preparationTime: 30,
                level: "Médio",
                portion: "6 porções",
                tools: ["tigela", "batedeira", "espátula", "taças ou potinhos para servir", "geladeira"],
                ingredients: ["200g de chocolate meio amargo", "3 ovos", "3 colheres de sopa de açúcar", "1 colher de chá de essência de baunilha (opcional)", "1 pitada de sal", "1 lata de creme de leite"],
                preparationInstructions: ["Derreta o chocolate meio amargo em banho-maria ou no micro-ondas, mexendo até ficar completamente derretido e liso. Reserve e deixe esfriar um pouco.", "Separe as gemas das claras dos ovos.", "Em uma tigela, bata as gemas com o açúcar até obter uma mistura clara e fofa.", "Adicione a essência de baunilha (se estiver usando) e a pitada de sal à mistura de gemas e açúcar, e continue batendo até incorporar.", "Adicione o chocolate derretido à mistura de gemas e açúcar, mexendo bem para incorporar.", "Em outra tigela, bata as claras em neve até obter picos firmes.", "Incorpore delicadamente as claras em neve à mistura de chocolate, fazendo movimentos suaves de baixo para cima até obter uma massa homogênea.", "Por fim, adicione o creme de leite à mistura e misture suavemente até ficar bem incorporado.", "Divida a mousse em taças ou potinhos individuais e leve à geladeira por pelo menos 4 horas, ou até que esteja bem firme.", "Sirva gelado e desfrute dessa irresistível mousse de chocolate!"]
            ),



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
                ingredients: ["500g de massa de lasanha pré-cozida", "500g de carne moída", "1 cebola média, picada", "3 dentes de alho, picados", "1 cenoura grande, ralada", "1 lata de molho de tomate", "2 colheres de sopa de extrato de tomate", "1 xícara de água", "1 colher de sopa de azeite de oliva", "Sal e pimenta a gosto", "300g de queijo muçarela ralado", "100g de queijo parmesão ralado"],
                preparationInstructions: ["Pré-aqueça o forno a 180°C.", "Em uma panela grande, aqueça o azeite de oliva e refogue a cebola e o alho até ficarem dourados.", "Adicione a carne moída e cozinhe até ficar bem dourada e cozida.", "Acrescente a cenoura ralada e refogue por mais alguns minutos.", "Adicione o molho de tomate, o extrato de tomate e a água. Tempere com sal e pimenta a gosto. Cozinhe em fogo baixo por cerca de 30 minutos, mexendo ocasionalmente.", "Em uma frigideira separada, aqueça um pouco de azeite e grelhe as folhas de massa de lasanha pré-cozida por alguns segundos de cada lado para dar uma leve tostada. Reserve.", "Em uma assadeira, monte a lasanha: comece com uma camada de molho bolonhesa, seguida de uma camada de massa de lasanha, uma camada de queijo muçarela ralado e uma camada de molho bolonhesa novamente. Repita esse processo até esgotar os ingredientes, finalizando com uma camada de molho bolonhesa por cima.", "Cubra a assadeira com papel alumínio e leve ao forno pré-aquecido por cerca de 40 minutos.", "Retire o papel alumínio e polvilhe o queijo parmesão ralado por cima da lasanha.", "Leve ao forno novamente, sem o papel alumínio, por mais 15-20 minutos, ou até que o queijo esteja dourado e borbulhante.", "Retire do forno e deixe descansar por alguns minutos antes de servir. Aproveite a deliciosa lasanha bolonhesa!"]
            ),
            Recipe(
                name: "Cassoulet",
                cardImage: "cardCassoulet",
                recipeImage: "recipeCassoulet",
                preparationTime: 8*60,
                level: "Elaborado",
                portion: "8 porções",
                tools: ["panela grande", "frigideira", "assadeira", "peneira", "espátula"],
                ingredients: ["500g de feijão branco", "500g de carne de porco (como lombo, paleta ou pernil), cortada em cubos", "4 coxas de pato confitadas", "200g de linguiça defumada, cortada em rodelas", "200g de bacon em cubos", "1 cebola grande, picada", "4 dentes de alho, picados", "2 cenouras médias, cortadas em rodelas", "2 tomates grandes, picados", "2 folhas de louro", "4 ramos de tomilho", "1 litro de caldo de carne", "2 colheres de sopa de azeite de oliva", "Sal e pimenta a gosto"],
                preparationInstructions: ["Deixe o feijão branco de molho em água fria por pelo menos 8 horas. Em seguida, escorra e reserve.", "Em uma panela grande, aqueça o azeite de oliva e frite o bacon até ficar dourado. Retire o bacon da panela e reserve.", "Na mesma panela, doure os cubos de carne de porco por todos os lados. Retire a carne da panela e reserve.", "Na mesma panela, adicione a cebola, o alho, as cenouras e os tomates. Refogue por alguns minutos até ficarem macios.", "Adicione o feijão branco escorrido, as folhas de louro, os ramos de tomilho e o caldo de carne à panela. Tempere com sal e pimenta a gosto.", "Cozinhe em fogo baixo por aproximadamente 2 horas, ou até que o feijão esteja macio e o caldo tenha reduzido e engrossado.", "Enquanto isso, pré-aqueça o forno a 180°C.", "Em uma frigideira separada, aqueça um pouco de azeite e doure as coxas de pato confitadas por todos os lados. Retire da frigideira e reserve.", "Em uma assadeira, monte o cassoulet: coloque uma camada de feijão cozido, seguida pelos cubos de carne de porco, as rodelas de linguiça defumada, as coxas de pato confitadas e o bacon reservado. Repita esse processo até esgotar os ingredientes, finalizando com uma camada de feijão por cima.", "Cubra a assadeira com papel alumínio e leve ao forno pré-aquecido por cerca de 1 hora.", "Retire o papel alumínio e deixe assar por mais 30 minutos, ou até que a parte de cima esteja dourada e crocante.", "Retire do forno e deixe descansar por alguns minutos antes de servir. Aproveite o delicioso Cassou."]
            ),
            Recipe(
                name: "Coq au Vin",
                cardImage: "cardCoqAuVin",
                recipeImage: "recipeCoqAuVin",
                preparationTime: 3*60,
                level: "Elaborado",
                portion: "6 porções",
                tools: ["panela grande", "frigideira", "peneira", "assadeira", "espátula", "barbante culinário"],
                ingredients: ["1 frango inteiro de aproximadamente 1,5kg", "200g de bacon em cubos", "200g de cogumelos frescos, fatiados", "20 echalotas pequenas, descascadas", "3 dentes de alho, picados", "750ml de vinho tinto seco", "500ml de caldo de galinha", "2 colheres de sopa de farinha de trigo", "2 colheres de sopa de manteiga", "2 colheres de sopa de azeite de oliva", "2 folhas de louro", "4 ramos de tomilho", "Sal e pimenta a gosto"],
                preparationInstructions: ["Corte o frango em pedaços menores, removendo a espinha dorsal e dividindo em coxas, sobrecoxas e peito. Tempere com sal e pimenta a gosto.", "Em uma panela grande, aqueça o azeite e a manteiga em fogo médio-alto. Adicione o bacon e frite até ficar dourado e crocante.", "Retire o bacon da panela e reserve. Na mesma panela, doure os pedaços de frango por todos os lados. Retire o frango da panela e reserve.", "Na mesma panela, adicione as echalotas, os cogumelos e o alho. Refogue por alguns minutos até ficarem dourados.", "Polvilhe a farinha de trigo sobre os vegetais e mexa bem para incorporar.", "Adicione o vinho tinto e mexa bem, raspando o fundo da panela para soltar os sabores.", "Adicione o caldo de galinha, o bacon reservado, as folhas de louro e os ramos de tomilho à panela. Tempere com sal e pimenta a gosto.", "Leve a panela ao fogo baixo, tampe e cozinhe por cerca de 2 horas, ou até que o frango esteja macio e o molho tenha reduzido e engrossado.", "Enquanto isso, pré-aqueça o forno a 180°C.", "Após o tempo de cozimento, retire o frango e os vegetais da panela e transfira para uma assadeira.", "Leve a assadeira ao forno por aproximadamente 15 minutos, apenas para dourar ligeiramente a pele do frango.", "Enquanto isso, coe o molho da panela através de uma peneira, descartando os sólidos. Retorne o molho coado à panela e cozinhe por mais alguns minutos para reduzir e concentrar os sabores.", "Retire o frango do forno, regue com o molho concentrado e sirva quente. Aproveite o saboroso Coq au Vin!"]
            )


        ]),
    ]
}
