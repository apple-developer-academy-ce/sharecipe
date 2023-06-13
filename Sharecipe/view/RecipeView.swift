import Foundation
import SwiftUI
import ActivityKit


struct RecipeView: View {
        var recipe: Recipe

        @State private var isTrackingTime: Bool = false
        @State private var startTime: Date? = nil

        @State private var activity: Activity<TimeTrackingAttributes>? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            Image("recipeTemplate")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)

            Text(recipe.name)

            Spacer()
        }
        .ignoresSafeArea(.all, edges: [.top])
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: .init(name: "Ovo", preparationTime: "10 min", image: "recipeTemplate"))
    }
}




//struct RecipeView: View {
//    var recipe: Recipe
//
//    @State private var isTrackingTime: Bool = false
//    @State private var startTime: Date? = nil
//
//    @State private var activity: Activity<TimeTrackingAttributes>? = nil
//
//
//    var body: some View {
//
//
//        ZStack {
//            Image("recipeTemplate")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .scaledToFit()
//                .edgesIgnoringSafeArea(.all)
//            Text(recipe.name)
//                .padding(.top,50)
//
//            HStack() {
//                    VStack {
//                        Image(systemName: "clock") // replace with your icon
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                        Text("Preparo")
//                    }
//                    .frame(maxWidth: .infinity)
//
//                    VStack {
//                        Image(systemName: "person.2.fill") // replace with your icon
//                            .resizable()
//                            .frame(width: 40, height: 30)
//                        Text("Servings")
//                    }
//                    .frame(maxWidth: .infinity)
//
//                    VStack {
//                        Image(systemName: "flame.fill") // replace with your icon
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                        Text("Calories")
//                    }
//                    .frame(maxWidth: .infinity)
//
//            }.padding(.top,150)
//        }
//
//
//
//        Spacer()
//
//
//
//    }
//}


//    var body: some View {
//        ZStack {
//            VStack (alignment: .center, spacing: 0) {
//
//                Image("recipeTemplate")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .scaledToFit()
//                    .edgesIgnoringSafeArea(.all)
//
//                Text(recipe.name)
//                    .font(.title)
//                    .padding(.top, -80)
//
//                Divider()
//
//                HStack {
//                    VStack {
//                       Image(systemName: "clock") // replace with your icon
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                       Text("Preparo")
//                   }
//                   .frame(maxWidth: .infinity)
//
//                   VStack {
//                       Image(systemName: "person.2.fill") // replace with your icon
//                           .resizable()
//                           .frame(width: 40, height: 30)
//                       Text("Servings")
//                   }
//                   .frame(maxWidth: .infinity)
//
//                   VStack {
//                       Image(systemName: "flame.fill") // replace with your icon
//                           .resizable()
//                           .frame(width: 30, height: 30)
//                       Text("Calories")
//                   }
//                   .frame(maxWidth: .infinity)
//                }
//                .padding(.top, 20)
//                .padding(.bottom,20)
//
//                Divider()
//
//                Spacer()
//
//            }
//
//        }
//
//    }
//}






//WORKING WIDGET
//
//VStack {
//
//    if let startTime {
//        Text(startTime, style: .relative)
//    }
//
//    Button {
//        isTrackingTime.toggle()
//        if isTrackingTime {
//            startTime = .now
//
//            // Start Live Activity
//            let attributes = TimeTrackingAttributes()
//            let state = TimeTrackingAttributes.ContentState(startTime: .now)
//
//            activity = try? Activity<TimeTrackingAttributes>.request(attributes: attributes, contentState: state, pushType: nil)
//
//        } else {
//            guard let startTime else {return}
//            let state = TimeTrackingAttributes.ContentState(startTime: startTime)
//
//            Task {
//                await activity?.end(using: state, dismissalPolicy: .immediate)
//            }
//
//            self.startTime = nil
//
//
//        }
//    } label: {
//        Text(isTrackingTime ? "STOP" : "INICIAR PREPARO")
//            .fontWeight(.light)
//            .foregroundColor(.white)
//            .frame(width: 200, height: 200)
//            .background(Circle().fill(isTrackingTime ? .red : .green))
//    }
//
//
////}
//
//    .border(Color.yellow)
//    .toolbarBackground(Color(.systemGray6), for: .navigationBar)
//    .toolbarBackground(.visible, for: .navigationBar)
//    .toolbar {
//
//        ToolbarItemGroup(placement: .principal) {
//
//        }
//
//        ToolbarItemGroup(placement: .navigationBarTrailing) {
//        }
//
//        ToolbarItemGroup(placement: .bottomBar) {
//        }
//    }
