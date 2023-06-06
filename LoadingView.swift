import SwiftUI

struct LoadingView: View {
    @State private var enableHomeView = false

    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("sharecipe") // Replace with your own logo image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
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
