import SwiftUI

struct Recipe: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let preparationTime: String

    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
}

struct CookingLevel: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let recipes: [Recipe]

    static func == (lhs: CookingLevel, rhs: CookingLevel) -> Bool {
        return lhs.id == rhs.id
    }
}

struct CustomSegmentedControl: View {
    @Binding var selectedSegment: Int
    let labels: [(String, String)]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                ForEach(0..<labels.count) { index in
                    Button(action: {
                        self.selectedSegment = index
                    }) {
                        HStack {
                            Image(labels[index].1)
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(labels[index].0)
                                .font(.subheadline)
                        }
                    }
                    .padding(10)

                }
                Spacer()
            }
            CustomUnderlineView(selectedSegment: $selectedSegment, labels: labels)
        }
    }
}

struct CustomUnderlineView: View {
    @Binding var selectedSegment: Int
    let labels: [(String, String)]

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(0..<labels.count) { index in
                        Rectangle()
                            .fill(index == selectedSegment ? Color.black : Color.gray)
                            .frame(width: geometry.size.width / CGFloat(labels.count), height: 2)
                    }
                }
            }
        }.frame(height: 2)
    }
}




struct HomeView: View {

    let cookingLevels: [CookingLevel] = [
        CookingLevel(name: "Simples", recipes: [
            Recipe(name: "Ovo Cuzido", preparationTime: "5 minutes"),
            Recipe(name: "Ovo Mexido", preparationTime: "5 minutes"),
            Recipe(name: "Bife do Olhão", preparationTime: "5 minutes"),
            Recipe(name: "Arroz Branco", preparationTime: "10 minutes"),
            Recipe(name: "Frango Desnutrido", preparationTime: "30 minutes"),

            // add other recipes for this level...
        ]),
        CookingLevel(name: "Médio", recipes: [
            Recipe(name: "Macarrão", preparationTime: "15 minutes"),
            Recipe(name: "Feijão", preparationTime: "30 minutes"),
        ]),
        CookingLevel(name: "Elaborado", recipes: [
            Recipe(name: "Macarronada", preparationTime: "15 minutes"),
            Recipe(name: "Feijoada", preparationTime: "30 minutes"),
        ]),
    ]

    @State private var selectedLevel: CookingLevel
    @State private var selectedLevelIndex: Int = 0


    init() {
        _selectedLevel = State(initialValue: cookingLevels[0])

    }

    var body: some View {
        ZStack {

            VStack {


                CustomSegmentedControl(selectedSegment: $selectedLevelIndex, labels: [
                    ("Simples", "OVO"),
                    ("Médio", "SANDUICHE"),
                    ("Elaborado", "PRESUNTO")
                ])

                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(cookingLevels[selectedLevelIndex].recipes) { recipe in
                            NavigationLink(destination: RecipeView(recipe: recipe)) {
                                VStack(alignment: .leading) {
                                    Text(recipe.name)
                                    Text("Preparation time: \(recipe.preparationTime)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity, minHeight: 200)
                                .padding()
                                .background(
                                    Image("cardTemplate")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }


                //Bypass to fix the background coolor of toolbar .bottombar
                HStack {
                    Spacer()
                }
                .background(Color(.systemGray6))
            }
        }
        .navigationBarBackButtonHidden()
        .toolbarBackground(Color(.systemGray6), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {

            ToolbarItem(placement: .principal) {
                Text("Sharecipe") //Title Aligned to the left of screen
                        .font(.custom("DeliCakeRegular", size: 36))
            }

            ToolbarItemGroup(placement: .navigationBarTrailing) {

//                Button(action: {
//
//                } ) {
//                    Image(systemName: "gearshape")
//                }
            }


            ToolbarItemGroup(placement: .bottomBar) {
            }
        }

    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
