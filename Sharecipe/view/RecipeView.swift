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

    //@State private var buttonPressed = false
    //@State private var selectedButtonID: UUID? = nil




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

                    .multilineTextAlignment(.center)
            }

            Divider()

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
                                if SharedDataManager.shared.buttonPressed {
                                    if (SharedDataManager.shared.recipe?.id == recipe.id) {
                                        Text("Lembrete definido para \(SharedDataManager.shared.targetTime).")
                                            .multilineTextAlignment(.center)
                                            .font(.callout)
                                            .foregroundColor(.red)
                                    } else {
                                        NavigationLink(destination: RecipeView(recipe: SharedDataManager.shared.recipe!)) {
                                            HStack {

                                                Image(systemName: "eye.trianglebadge.exclamationmark.fill")

                                                    .resizable()
                                                    .frame(width: 55, height: 30)
                                                    .foregroundColor(.yellow)

                                                (
                                                    Text("Você já possui uma receita em andamento. Por favor, finalize sua receita anterior antes de iniciar uma nova. ")
                                                        .foregroundColor(Color(.systemGray))
                                                    +

                                                    Text("Receita de Nível \(SharedDataManager.shared.recipe?.level ?? "Unknow Recipe"),  \(SharedDataManager.shared.recipe?.name ?? "Unknow Recipe"). ")
                                                        .foregroundColor(.red)

                                                    +

                                                    Text("Toque para ver a receita em andamento...")
                                                        .foregroundColor(Color(.systemGray))
                                                )
                                                .multilineTextAlignment(.leading)
                                                .font(.callout)
                                            }
                                        }
                                    }
                                }
                                else {
                                    Text("Dica: pressione o relógio para ativar lembrete.")
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color(.systemGray))
                                        .font(.callout)
                                }
                            }
                            .scaleEffect(SharedDataManager.shared.buttonPressed ? 1.0 : 1.0) // add a scale effect for button pressed
                            .animation(.easeInOut) // animate the scale effect
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                    .padding(.bottom,10)
                }

                //Instruções de Preparo
                Group {
                    VStack(alignment: .leading) {

                        //INIT OF ForEach
                        ForEach(recipe.preparationInstructions, id: \.self) { instruction in

                            //TODO: BUG FOUND
                            //MARK: DESCOBRIR COMO RESOLVER - PROBLEMA NO ANIMATION
                            //MARK: APOS ATUALIZAR O SHARED.BUTTONPRESSED, APLICACAO ENTRA NO OUTRO IF (ELSE IF) ????
                            //Se o tempo de preparo for diferente de zero e o botão de iniciar preparo não tiver sido precionado, isso implica que não existe nenhuma receita ativa, logo mostra o texto normalmente.

                                HStack {

                                    if (instruction.time == 0) {
                                        Text("\(instruction.step)")
                                        .font(.subheadline)
                                        .fontWeight(.regular)
                                    }

                                    if (instruction.time != 0) {

                                        if (SharedDataManager.shared.buttonPressed == false) {

                                            Text("\(instruction.step)")
                                                .font(.subheadline)
                                                .fontWeight(.regular)
                                                .foregroundColor(.blue)

                                            Image(systemName: "clock")
                                                .foregroundColor(.blue)
                                        }

                                        if (SharedDataManager.shared.buttonPressed == true) {


                                            if(instruction.id == SharedDataManager.shared.instructionId) {

                                                Text("\(instruction.step)")
                                                    .font(.title3)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.red)
                                                
                                                ProgressView()
                                                    .padding(.leading,3)
                                                    .tint(.red)
                                            }
                                            else {
                                                if (SharedDataManager.shared.recipe?.id != recipe.id) {
                                                    Text("\(instruction.step)")
                                                        .font(.subheadline)
                                                        .fontWeight(.regular)
                                                    Image(systemName: "clock")
                                                }
                                                else {
                                                    Text("\(instruction.step)")
                                                        .font(.subheadline)
                                                        .fontWeight(.regular)
                                                        .foregroundColor(.blue)
                                                    Image(systemName: "clock")
                                                        .foregroundColor(.blue)
                                                }
                                            }
                                        }

                                    }

                                }
                                .padding(.bottom,5)

                                .alert(isPresented: $showingAlert) { SharedDataManager.shared.getAlert(for: instruction) }

                                .gesture(LongPressGesture(minimumDuration: 0.5).onEnded { _ in

                                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                                    generator.impactOccurred()

                                    if (!(workingOnRecipeManager.isWorkingOnRecipe && recipe.id != SharedDataManager.shared.recipe?.id)) {
                                        //INVERTE A SITUACAO DO BOTAO PARA VERDADEIRO OU FALSOE
                                        workingOnRecipeManager.isWorkingOnRecipe.toggle()


                                        //SE O USUARIO INICIOU UMA ETAPA DE RECEITA, ATIVA TUDO
                                        //MARK: ACTIVE ALL
                                        if workingOnRecipeManager.isWorkingOnRecipe {

                                        //Passing TargetTime to DataManager (Global)
                                        SharedDataManager.shared.setTargetTime(minutes: instruction.time)

                                        // FOR VISUAL FX AND DATA CONTROL
                                        SharedDataManager.shared.setButtonPressed(isPressed: true)
                                        SharedDataManager.shared.setSelectedButtonID(id: instruction.id)
                                        SharedDataManager.shared.setRecipe(recipe: recipe)

                                        // FOR ALERT ONLY
                                        self.showingAlert = true

                                        //MARK: FOR DEBUG ONLY - MAY KEEP THIS DISABLE IF U WANT
                                        //MARK: Print the in console the TargetTime for preparationInstructions
                                        SharedDataManager.shared.getFormattedTargetTime()

                                        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                                         *                    ENABLE NOTIFICATION CENTER                     *
                                         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

                                        // Start a timer based on recipe.preparationTime (converted to seconds)
                                        let deadline = instruction.time * 60

                                        // Call Notification Center
                                        LocalNotificationManager.shared.scheduleNotification(title: "Seu preparo está pronto!", body: "Toque para abrir o app.", timeInterval: TimeInterval(deadline))

                                        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                                         *                          ENABLE LIVE ACTIVITY                     *
                                         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

                                        // Start Live Activity
                                        // LACK OF DOCUMENTATION - COMPLETAMENTE BUGADO
                                        let attributes = TimeTrackingAttributes()
                                        // Pass selected instruction to state for the activity
                                        let state = TimeTrackingAttributes.ContentState(recipe: recipe, instruction: instruction)
                                        activity = try? Activity<TimeTrackingAttributes>.request(attributes: attributes, contentState: state, pushType: nil)

                                        ActivityManager.shared.activity = activity

                                        ActivityManager.shared.recipe = recipe

                                    } else {

                                        print("[DEBUG / RecipeView.swift]: Cancel button pressed;\n")
                                        // FOR VISUAL FX AND DATA CONTROL
                                        SharedDataManager.shared.setButtonPressed(isPressed: false)
                                        SharedDataManager.shared.setSelectedButtonID(id: nil)
                                        SharedDataManager.shared.setRecipe(recipe: nil)

                                        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                                         *                    DISABLE NOTIFICATION CENTER                     *
                                         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
                                        print("[DEBUG / RecipeView.swift]: Removing All Pending Notification Requests\n")

                                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

                                        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                                         *                    DISABLE LIVE ACTIVITIES                          *
                                         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
                                        ActivityManager.shared.endActivity()

                                    }
                                }

                                    else {
                                        //DO NOTHING
                                    }
                                })

                        } //END OF FOREACH
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

            }
            .padding(.leading)
            .padding(.trailing)
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
        //        .toolbar {
        //            ToolbarItemGroup(placement: .navigation) {
        //                Button("First") {
        //                    print("Pressed")
        //                }
        //
        //                Spacer()
        //
        //                Button("Second") {
        //                    print("Pressed")
        //                }
        //            }
        //        }
    }
}
