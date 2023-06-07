import Foundation
import SwiftUI

struct RecipeView: View {
    var recipe: MenuItem
//
//    var body: some View {
//        ZStack {
//            // You can use the 'recipe' property here.
//            // For instance, you could display the recipe's name:
//            Text(recipe.id.uuidString)
//                .padding(.bottom,100)
//            Text(recipe.name)
//        }
//    }


    var body: some View {
        ZStack {

            VStack {

                ScrollView(.horizontal, showsIndicators: false) {


                }
                .border(Color.blue)

                //Bypass to fix the background coolor of toolbar .bottombar
                HStack {
                    Spacer()
                }
                .background(Color(.systemGray6))
            }
        }
        .border(Color.yellow)
        .toolbarBackground(Color(.systemGray6), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
            }

            ToolbarItemGroup(placement: .bottomBar) {
            }
        }

    }
}
