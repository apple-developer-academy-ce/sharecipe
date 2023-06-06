import SwiftUI

struct MenuItem: Identifiable, Equatable {
    let id = UUID()
    let name: String

    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.id == rhs.id
    }
}

struct HomeView: View {
    let horizontalMenuItems: [MenuItem] = [
        MenuItem(name: "Iniciante"),
        MenuItem(name: "Aprendiz"),
        MenuItem(name: "Intermediário"),
        MenuItem(name: "Avançado"),
        MenuItem(name: "Gourmet")
    ]

    //Iniciante Options
    let verticalMenuItems: [MenuItem] = [
        MenuItem(name: "Ovo Cuzido"),
        MenuItem(name: "Ovo Estralado"),
        MenuItem(name: "Arroz Branco"),
        MenuItem(name: "Nissim Miojo")
    ]

    //Aprendiz Options
    let verticalMenuItems2: [MenuItem] = [
        MenuItem(name: "Item E"),
        MenuItem(name: "Item F"),
        MenuItem(name: "Item G"),
        MenuItem(name: "Item H")
    ]

    //Intermediário Options
    let verticalMenuItems3: [MenuItem] = [
        MenuItem(name: "Item I"),
        MenuItem(name: "Item J"),
        MenuItem(name: "Item K"),
        MenuItem(name: "Item L")
    ]

    //Avançado Options
    let verticalMenuItems4: [MenuItem] = [
        MenuItem(name: "Item n"),
        MenuItem(name: "Item o"),
        MenuItem(name: "Item p"),
        MenuItem(name: "Item q")
    ]

    //Gourmet Options
    let verticalMenuItems5: [MenuItem] = [
        MenuItem(name: "Item r"),
        MenuItem(name: "Item s"),
        MenuItem(name: "Item t"),
        MenuItem(name: "Item u")
    ]

    @State private var selectedItem: MenuItem?

    init() {
        _selectedItem = State(initialValue: horizontalMenuItems[0])
    }

    var body: some View {

            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(horizontalMenuItems) { item in
                            Button(action: {
                                self.selectedItem = item
                            }) {
                                Text(item.name)
                                    .frame(minWidth: 110, maxWidth: 110, minHeight: 15)
                                    .padding()
                                    .background(self.selectedItem == item ? Color.gray : Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
                .border(Color.green)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(currentVerticalMenuItems()) { item in


                            NavigationLink(destination: RecipeView(recipe: item)) {
                                Text(item.name)
                                    .frame(maxWidth: .infinity, minHeight: 15)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
                .border(Color.blue)
            }
            .navigationBarBackButtonHidden()
    }

    func currentVerticalMenuItems() -> [MenuItem] {
        if selectedItem == horizontalMenuItems[0] {
            return verticalMenuItems
        } else if selectedItem == horizontalMenuItems[1] {
            return verticalMenuItems2
        } else if selectedItem == horizontalMenuItems[2] {
            return verticalMenuItems3
        } else if selectedItem == horizontalMenuItems[3] {
            return verticalMenuItems4
        } else if selectedItem == horizontalMenuItems[4] {
            return verticalMenuItems5
        } else {
            return [] // or return a default set of items
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
