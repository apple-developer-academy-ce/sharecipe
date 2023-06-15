import Foundation
import SwiftUI
import ActivityKit
import AVFoundation


struct RecipeView: View {
    var recipe: Recipe

    @State private var isTrackingTime: Bool = false
    @State private var startTime: Date? = nil

    @State private var activity: Activity<TimeTrackingAttributes>? = nil

    // Define the grid layout: 3 columns of flexible width.
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    //@State private var audioPlayer: AVAudioPlayer?

    @EnvironmentObject var audioPlayerManager: AudioPlayerManager



    var body: some View {
        VStack(spacing: 0) {

            //Recipe Image and Title
            Group {
                Image(recipe.recipeImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)

                Text(recipe.name)
                    .font(.title)
            }

            ScrollView {

                //Resumo da Receita
                Group {

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
                            Text("\(recipe.preparationTime)")
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

                }

                Divider()

                //Utensilios Necessários
                Group {
                    HStack {
                        VStack {
                            Text("Utensílios")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom,5)

                    LazyVGrid(columns: gridLayout, spacing: 20) {
                        ForEach(recipe.tools, id: \.self) { tool in
                            Text(tool)
                                .multilineTextAlignment(.center)
                                .font(.subheadline)
                                .frame(maxWidth: .infinity)
                        }


                    }

                }
                .padding(.leading,5)
                .padding(.trailing,5)
                .padding(.bottom,5)

                Divider()

                //Ingredientes Necessários
                Group {
                    HStack {
                        VStack {
                            Text("Ingredientes")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom,5)

                    LazyVGrid(columns: gridLayout, spacing: 20) {
                        ForEach(recipe.ingredients, id: \.self) { ingredients in
                            Text(ingredients)
                                .multilineTextAlignment(.center)
                                .font(.subheadline)
                                .frame(maxWidth: .infinity)
                        }
                    }


                }
                .padding(.leading,5)
                .padding(.trailing,5)
                .padding(.bottom,5)

                Divider()

                //Modo de Preparo
                Group {
                    HStack {
                        VStack() {
                            Text("Modo de Preparo")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom,10)

                    VStack(alignment: .leading) {
                        ForEach(recipe.preparationInstructions, id: \.self) { preparationInstructions in
                            Text(preparationInstructions)
                                .font(.subheadline)
                                .padding(.leading,10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    VStack {
                        Button {
                            isTrackingTime.toggle()
                            if isTrackingTime {
                                startTime = .now

                                print ("Audio Started")

                                // Start Live Activity
                                let attributes = TimeTrackingAttributes()
                                let state = TimeTrackingAttributes.ContentState(recipe: recipe)
                                activity = try? Activity<TimeTrackingAttributes>.request(attributes: attributes, contentState: state, pushType: nil)

                                // Start a timer based on recipe.preparationTime (converted to seconds)
                                let deadline = DispatchTime.now() + .seconds(recipe.preparationTime * 5)

                                DispatchQueue.main.asyncAfter(deadline: deadline) {
                                    if isTrackingTime {
                                        if let sound = Bundle.main.url(forResource: "song", withExtension: "mp3") {
                                            self.audioPlayerManager.playSound(sound: sound)
                                        }
                                    }
                                }
                            } else {
                                print ("Audio Stopped")

                                self.audioPlayerManager.stopSound()

                                let state = TimeTrackingAttributes.ContentState(recipe: recipe)
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
                                .cornerRadius(20)
                        }.padding(.top,10)

                    }
                }
            }
            .padding(.bottom,-10)

            Spacer()

            //Hack to fix the background coolor of toolbar .bottombar
            HStack {
                Spacer()
                Text("")
            }
            .background(Color(.systemGray6))


        }
        .ignoresSafeArea(.all, edges: [.top])
        .toolbarBackground(Color(.systemGray6).opacity(0.0), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {

            ToolbarItem(placement: .principal) {
            }

            ToolbarItemGroup(placement: .navigationBarTrailing) {
            }


            ToolbarItemGroup(placement: .bottomBar) {
            }
        }
    }
}
