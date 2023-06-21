import SwiftUI

struct ElaboradoView: View {
    @Environment(\.colorScheme) var colorScheme


    var body: some View {

        VStack {

            //WORKING MENU
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(RecipeData.cookingLevels[2].recipes) { recipe in
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            ZStack(alignment: .bottomLeading) {
                                Image(recipe.cardImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(recipe.name)
                                        .font(UIDevice.current.userInterfaceIdiom == .phone ? .body : .largeTitle)
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Tempo de Preparo:")
                                            .font(UIDevice.current.userInterfaceIdiom == .phone ? .subheadline : .title)
                                            .foregroundColor(Color(.systemGray))

                                        Text("\(recipe.preparationTime) minutos")
                                            .font(UIDevice.current.userInterfaceIdiom == .phone ? .subheadline : .title)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(.systemGray))

                                    }
                                }
                                //.frame(maxWidth: .infinity, minHeight: 10)

                                .padding()
                                .background(Color.black.opacity(0.6))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }

                            .frame(maxWidth: .infinity, minHeight: 200)
                            .cornerRadius(8)
                            .padding(.bottom,10)

                        }
                    }
                }
                .shadow(color: colorScheme == .dark ? Color.white.opacity(0.0) : Color.primary.opacity(1.0), radius: 5, x: 0, y: 0)

                .padding()
            }
        }
        //.border(Color.blue)

    }

}

struct ElaboradoView_Previews: PreviewProvider {
    static var previews: some View {
        ElaboradoView()
    }
}
