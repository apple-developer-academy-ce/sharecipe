import Foundation
import SwiftUI
import ActivityKit
//import AVFoundation


struct RecipeView: View {
    var recipe: Recipe

    //@State private var isTrackingTime: Bool = false
    //@State private var startTime: Date? = nil
    @State private var activity: Activity<TimeTrackingAttributes>? = nil
    @State private var showingAlert = false
    @State private var buttonPressed = false
    @State private var selectedButtonID: UUID? = nil




    // Define the grid layout: 3 columns of flexible width.
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    //Modular
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var workingOnRecipeManager: WorkingOnRecipeManager //Observes a Envrioment Object (Global Var)
    //@EnvironmentObject var audioPlayerManager: AudioPlayerManager



    var body: some View {

            VStack(spacing: 0) {

                //Recipe Image and Title
                Group {
                    Image(recipe.recipeImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)

                    Text(recipe.name)
                        .font(.custom("HV-Cocktail-Regular", size: UIDevice.current.userInterfaceIdiom == .phone ? 32 : 64))
//                        .font(.title)
//                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom,5)
                    Divider()
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
                            VStack {
                                VStack() {
                                    Text("Modo de Preparo")
                                        .bold()
                                }
                                VStack {
                                    if buttonPressed {
                                        Text("Lembrete definido para \(SharedDataManager.shared.targetTime).")
                                            .multilineTextAlignment(.center)
                                            .font(.callout)
                                            .foregroundColor(.red)
                                    }
                                    else {
                                        Text("Dica: pressione o relógio para ativar lembrete.")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color(.systemGray))
                                            .font(.callout)
                                    }
                                }
                                .scaleEffect(buttonPressed ? 1.1 : 1.0) // add a scale effect for button pressed
                                .animation(.easeInOut) // animate the scale effect
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding()
                        .padding(.bottom,10)

                        VStack(alignment: .leading) {
                            
                            ForEach(recipe.preparationInstructions, id: \.self) { instruction in

                                if instruction.time != 0 {

                                    HStack {
                                        Text("\(instruction.step)")
                                            .font(buttonPressed && instruction.id == selectedButtonID ? .title : .subheadline) // Dynamically change font size
                                            .foregroundColor(buttonPressed && instruction.id == selectedButtonID ? .red : .blue)
                                            .lineLimit(nil) // This allows the text to wrap onto as many lines as needed
                                            .fixedSize(horizontal: false, vertical: true) // This allows the text view to expand vertically to fit the text
                                            .transition(.scale) // Add transition for smoother change
                                            .animation(.easeInOut, value: buttonPressed && instruction.id == selectedButtonID) // Apply animation


                                        if (buttonPressed && instruction.id == selectedButtonID) {
                                            ProgressView()
                                                .padding(.leading,3)
                                                .tint(.red)

                                        } else {
                                            Image(systemName: "clock")
                                            .foregroundColor(buttonPressed && instruction.id == selectedButtonID ? .red : .blue)
                                        }

                                    }
                                    .gesture(LongPressGesture(minimumDuration: 0.5).onEnded { _ in

                                        let generator = UIImpactFeedbackGenerator(style: .heavy)

                                        generator.impactOccurred()

                                        workingOnRecipeManager.isWorkingOnRecipe.toggle()

                                        //Getting the button UUID
                                        self.selectedButtonID = instruction.id

                                        if workingOnRecipeManager.isWorkingOnRecipe {

                                                //Passing TargetTime to DataManager (Global)
                                                SharedDataManager.shared.setTargetTime(minutes: instruction.time)

                                                //Create a Local Data Formatter
                                                let formatter = DateFormatter()
                                                formatter.dateFormat = "dd MMMM, yyyy - HH:mm:ss"
                                                formatter.timeZone = TimeZone.current

                                                let localTime = formatter.string(from: SharedDataManager.shared.targetTime)

                                                //For Debug Only
                                                print("Scheduling Notification \(localTime)")

                                                // Start Live Activity
                                                let attributes = TimeTrackingAttributes()
                                                let state = TimeTrackingAttributes.ContentState(recipe: recipe)

                                                activity = try? Activity<TimeTrackingAttributes>.request(attributes: attributes, contentState: state, pushType: nil)

                                                ActivityManager.shared.activity = activity
                                                ActivityManager.shared.recipe = recipe

                                                // Start a timer based on recipe.preparationTime (converted to seconds)
                                                let deadline = DispatchTime.now() + .seconds(instruction.time * 60)

                                                // Update button state
                                                self.buttonPressed = true

                                                // Show the alert.
                                                self.showingAlert = true


                                                DispatchQueue.main.asyncAfter(deadline: deadline) {

                                                    if workingOnRecipeManager.isWorkingOnRecipe {
                                                        print ("Recipe Complete - Show Notification")
                                                        LocalNotificationManager.shared.scheduleNotification(title: "Seu preparo está pronto!", body: "Toque para abrir o app.", timeInterval: 1)
                                                    }
                                                }

                                            }
                                        else {

                                                // Cancel all notifications if preparation is stopped
                                                print("Cancel Button Pressed - Removing all pending notifications requests")
                                                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

                                                // Cancell all live activity if preparation is stopped
                                                let state = TimeTrackingAttributes.ContentState(recipe: recipe)

                                                // Cancel the timer text notification
                                                self.buttonPressed = false

                                                Task {
                                                    print("Dismissing all live activity")
                                                    await activity?.end(using: state, dismissalPolicy: .immediate)
                                                }
                                                //self.startTime = nil

                                                print ("Ending All Activities")
                                                ActivityManager.shared.endActivity()
                                            
                                            }
                                        })

                                    .padding(.bottom,5)
                                    .alert(isPresented: $showingAlert) {
                                        Alert(title: Text("Você iniciou um preparo!"), message: Text("Este estágio ficará pronto em \(instruction.time) minuto(s)."), dismissButton: .default(Text("Ok!")))
                                    }
                                } else {
                                    Text(instruction.step)
                                        .font(.subheadline)
                                        .padding(.bottom,5)

                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
                .padding(.bottom,-10)

                Spacer()

                //Hack to fix the background coolor of toolbar .bottombar
                HStack {
                    Spacer()
                    Text("")
                }
                .background(Color(.systemGray6))
                //End of Hack


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
