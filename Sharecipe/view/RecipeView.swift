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
                .font(.title)

                .padding()

            Divider()

            ScrollView {
                HStack {
                    VStack {
                        Image("PRATO") // replace with your icon
                            .resizable()
                            .frame(width: 40, height: 40)

                    }
                    .frame(maxWidth: .infinity)

                    VStack {
                        Image("TIGELA") // replace with your icon
                            .resizable()
                            .frame(width: 40, height: 40)

                    }
                    .frame(maxWidth: .infinity)

                    VStack {
                        Image("CHAPEU") // replace with your icon
                            .resizable()
                            .frame(width: 40, height: 40)

                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.top,10)
                HStack {
                    VStack {
                        Text("Preparo")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                        Text(recipe.preparationTime)
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    VStack {
                        Text("Dificuldade")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)

                        Text(recipe.level)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    VStack {
                        Text("Rendimento")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)

                        Text(recipe.portion)
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .bold()

                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom,5)

                Divider()

                HStack {
                    VStack {
                        Text("Utensílios")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom,5)

                HStack {
                    VStack {
                        Text("01 - Panela")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)


                }.padding(.bottom,5)

                HStack {
                    VStack {
                        Text("Ingredientes")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom,5)

                HStack {
                    VStack {
                        Text("01 - Ovo de Galinha")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)

                    VStack {
                        Text("300ml de Água")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)

                    VStack {
                        Text("01 - Colher de Chá de Sal de Cozinha")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)

                }
                .padding(.trailing,10)
                .padding(.bottom,5)

                HStack {
                    VStack() {
                        Text("Modo de Preparo")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom,10)

                VStack(alignment: .leading) {

                    Text("1. Coloque ovo na água")
                        .font(.subheadline)
                        .padding(.leading,10)

                    Text("2. Ligue o fogo da panela e deixe-a até a água começar a ferver.")
                        .font(.subheadline)
                        .padding(.leading,10)

                    Text("3. Aguarde 10 minutos até que seu ovo esteja pronto para consumo")
                        .font(.subheadline)
                        .padding(.leading,10)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
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
                        Text(isTrackingTime ? "PARAR" : "INICIAR PREPARO")
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(Rectangle().fill(isTrackingTime ? .red : .green))
                            .cornerRadius(10)  // Aqui você pode ajustar o valor para o raio que você deseja
                    }

                }

            }
            Spacer()
        }
        .ignoresSafeArea(.all, edges: [.top])
    }
}
