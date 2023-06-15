import SwiftUI

struct LoadingView: View {
    @State private var enableHomeView = false

    init(){
        for familyName in UIFont.familyNames {
            print(familyName)

            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print ("\(fontName)")
            }
        }
    }

    var body: some View {
        ZStack {
            // Use the AppLoadingScreenBG image as a tiling background
            Image("AppBG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
                .opacity(0.2)

            HStack {
                VStack {
                    Text("Flavory") // This is the title
                        .font(.custom("HV-Cocktail-Regular", size: 32))
                        .foregroundColor(Color.primary)
                    Text("Your finest cooking app!") // This is the subtitle
                        .font(.custom("HV-Cocktail-Regular", size: 16))
                        .foregroundColor(Color.primary)

                    Image("AppLoadingScreen") // Replace with your own logo image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                }
                .padding(10)
            }
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .opacity(0.7)
            .overlay {
                VStack {
                    Text("Flavory") // This is the title
                        .font(.custom("HV-Cocktail-Regular", size: 32))
                        .foregroundColor(Color.primary)
                    Text("Your finest cooking app!") // This is the subtitle
                        .font(.custom("HV-Cocktail-Regular", size: 16))
                        .foregroundColor(Color.primary)

                    Image("AppLoadingScreen") // Replace with your own logo image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                }
            }

        }

        .onAppear(perform: prepareToNavigate)
        .onTapGesture {
            self.enableHomeView = true
        }
        .navigationDestination(isPresented: $enableHomeView) {
            HomeView()
        }
    }

    private func prepareToNavigate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.enableHomeView = true
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
