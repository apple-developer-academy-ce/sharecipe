import Foundation
import SwiftUI
import ActivityKit
import AVFoundation


struct RecipeView: View {
    var recipe: Recipe

    //@State private var isTrackingTime: Bool = false
    @State private var startTime: Date? = nil
    @State private var activity: Activity<TimeTrackingAttributes>? = nil

    // Define the grid layout: 3 columns of flexible width.
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    //Modular
    @EnvironmentObject var workingOnRecipeManager: WorkingOnRecipeManager //Observes a Envrioment Object (Global Var)
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
                    .multilineTextAlignment(.center)
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
                            Text("\(recipe.preparationTime) minutos")
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
                            workingOnRecipeManager.isWorkingOnRecipe.toggle()
                            if workingOnRecipeManager.isWorkingOnRecipe {
                                startTime = .now

                                print ("Audio Started")

                                // Start Live Activity
                                let attributes = TimeTrackingAttributes()
                                let state = TimeTrackingAttributes.ContentState(recipe: recipe)
                                activity = try? Activity<TimeTrackingAttributes>.request(attributes: attributes, contentState: state, pushType: nil)

                                ActivityManager.shared.activity = activity
                                ActivityManager.shared.recipe = recipe

                                // Start a timer based on recipe.preparationTime (converted to seconds)
                                let deadline = DispatchTime.now() + .seconds(recipe.preparationTime * 60)

                                print (deadline)

                                DispatchQueue.main.asyncAfter(deadline: deadline) {
                                    if workingOnRecipeManager.isWorkingOnRecipe {
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

                                ActivityManager.shared.endActivity()
                            }
                        } label: {
                            Text(workingOnRecipeManager.isWorkingOnRecipe ? "PARAR" : "INICIAR PREPARO")

                                .foregroundColor(.white)
                                .font(UIDevice.current.userInterfaceIdiom == .phone ? .title3.weight(.semibold) : .title.weight(.semibold))
                                .frame(width: UIDevice.current.userInterfaceIdiom == .phone ? 200 : 350, height: UIDevice.current.userInterfaceIdiom == .phone ? 40 : 70)
                                .background(Rectangle().fill(workingOnRecipeManager.isWorkingOnRecipe ? .red : .green))
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
