import SwiftUI

struct LoadingView: View {
    @State private var enableHomeView = false

    var body: some View {

        ZStack {
            // Use the AppLoadingScreenBG image as a tiling background
            Image("AppBG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)


            HStack {
                VStack {

                }
                .padding(10)
            }
            .frame(maxWidth: .infinity, minHeight: 200)
            .background(Color(.systemGray6))
            .opacity(0.8)
            .overlay {
                VStack {
                    Text("Flavory") // This is the title
                        .font(.custom("HV-Cocktail-Regular", size: UIDevice.current.userInterfaceIdiom == .phone ? 32 : 64))
                        .foregroundColor(Color.primary)

                    Text("Seu app de culinária!") // This is the subtitle
                        .font(.custom("HV-Cocktail-Regular", size: UIDevice.current.userInterfaceIdiom == .phone ? 16 : 32))
                        .foregroundColor(Color.primary)

                }
            }

        }
        .edgesIgnoringSafeArea(.all)

        .onAppear(perform: prepareToNavigate)
        .onTapGesture {
            self.enableHomeView = true
        }
        .navigationDestination(isPresented: $enableHomeView) {
            ContentView()
        }
    }

    private func prepareToNavigate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.enableHomeView = true
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
