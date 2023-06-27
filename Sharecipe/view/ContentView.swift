import Foundation
import SwiftUI


struct ContentView: View {

    @State private var selectedTab = 0
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false


    var body: some View {
        ZStack {
            VStack(spacing: 0) {

                TabView(selection: $selectedTab) {

                    SimplesView()
                        .tag(0)
                    
                    MedioView()
                        .tag(1)

                    ElaboradoView()
                        .tag(2)


                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))


                //Bypass to fix the background coolor of toolbar .bottombar
                HStack {
                    Spacer()
                    Text("")
                }
                .background(Color(.systemGray6))
            }
        }
        .navigationBarBackButtonHidden()
        .toolbarBackground(Color(.systemGray6), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {

            ToolbarItem(placement: .principal) {

                Text("Flavory") //Title Aligned to the left of screen
                    .font(.custom("HV-Cocktail-Regular", size: UIDevice.current.userInterfaceIdiom == .phone ? 36 : 72))
            }
            ToolbarItem(placement: .navigationBarTrailing) {

                Button {
                    isDarkMode.toggle()
                } label: {
                    Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                }
            }

            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()

                Button(action: { selectedTab = 0 }) {
                    VStack(spacing: 0) {
                        Image("OVO")
                            .resizable()
                            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 60 : 30, height: UIDevice.current.userInterfaceIdiom == .pad ? 60 : 30)
                            .foregroundColor(selectedTab == 0 ? .primary : .secondary)
                        Text("Simples")
                            .foregroundColor(selectedTab == 0 ? .primary : .secondary)
                    }
                }

                Spacer()

                Button(action: { selectedTab = 1 }) {
                    VStack(spacing: 0) {
                        Image("SANDUICHE")
                            .resizable()
                            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 60 : 30, height: UIDevice.current.userInterfaceIdiom == .pad ? 60 : 30)
                            .foregroundColor(selectedTab == 1 ? .primary : .secondary)
                        Text("Médio")
                            .foregroundColor(selectedTab == 1 ? .primary : .secondary)
                    }
                }

                Spacer()

                Button(action: { selectedTab = 2 }) {
                    VStack(spacing: 0) {
                        Image("PRESUNTO")
                            .resizable()
                            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 60 : 30, height: UIDevice.current.userInterfaceIdiom == .pad ? 60 : 30)
                            .foregroundColor(selectedTab == 2 ? .primary : .secondary)
                        Text("Elaborado")
                            .foregroundColor(selectedTab == 2 ? .primary : .secondary)
                    }
                }

                Spacer()
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)


    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
