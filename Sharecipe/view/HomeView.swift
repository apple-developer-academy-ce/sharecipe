import SwiftUI

struct Recipe: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let cardImage: String
    let recipeImage: String
    let preparationTime: String
    let level: String
    let portion: String
    let tools: [String]
    let ingredients: [String]
    let preparationInstructions: [String]

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
                                .foregroundColor(Color.primary)
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
                            .fill(index == selectedSegment ? Color.primary : Color.gray)
                            .frame(width: geometry.size.width / CGFloat(labels.count), height: 2)
                    }
                }
            }
        }.frame(height: 2)
    }
}

struct HomeView: View {

    @State private var selectedLevel: CookingLevel
    @State private var selectedLevelIndex: Int = 0


    init() {
        _selectedLevel = State(initialValue: RecipeData.cookingLevels[0])

    }

    var body: some View {
        ZStack {

            VStack {


                CustomSegmentedControl(selectedSegment: $selectedLevelIndex, labels: [
                    ("Simples", "OVO"),
                    ("Médio", "SANDUICHE"),
                    ("Elaborado", "PRESUNTO")
                ])


                //WORKING MENU
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(RecipeData.cookingLevels[selectedLevelIndex].recipes) { recipe in
                            NavigationLink(destination: RecipeView(recipe: recipe)) {
                                ZStack(alignment: .bottomLeading) {
                                    Image(recipe.cardImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(8)

                                    VStack(alignment: .leading) {
                                        Text(recipe.name)
                                        Text("Preparation time: \(recipe.preparationTime)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    //.frame(maxWidth: .infinity, minHeight: 10)

                                    .padding()
                                    .background(Color.black.opacity(0.3))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                }

                                .frame(maxWidth: .infinity, minHeight: 200)
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }



                //Bypass to fix the background coolor of toolbar .bottombar
                HStack {
                    Spacer()
                    Text("")
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
