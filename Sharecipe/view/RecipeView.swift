import Foundation
import SwiftUI
import ActivityKit

struct RecipeView: View {
    var recipe: MenuItem

    @State private var isTrackingTime: Bool = false
    @State private var startTime: Date? = nil

    @State private var activity: Activity<TimeTrackingAttributes>? = nil


    var body: some View {
        ZStack {

            VStack {

                if let startTime {
                    Text(startTime, style: .relative)
                }

                Button {
                    isTrackingTime.toggle()
                    if isTrackingTime {
                        startTime = .now

                        // Start Live Activity
                        let attributes = TimeTrackingAttributes()
                        let state = TimeTrackingAttributes.ContentState(startTime: .now)

                        activity = try? Activity<TimeTrackingAttributes>.request(attributes: attributes, contentState: state, pushType: nil)

                    } else {
                        guard let startTime else {return}
                        let state = TimeTrackingAttributes.ContentState(startTime: startTime)

                        Task {
                            await activity?.end(using: state, dismissalPolicy: .immediate)
                        }

                        self.startTime = nil


                    }
                } label: {
                    Text(isTrackingTime ? "STOP" : "INICIAR PREPARO")
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .background(Circle().fill(isTrackingTime ? .red : .green))
                }

//                //Bypass to fix the background coolor of toolbar .bottombar
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                    }
//                    .background(Color(.systemGray6))
//                }

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
