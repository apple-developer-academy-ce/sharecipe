import SwiftUI

struct SegmentationView: View {
    @State private var selectedSegment = 0
    var body: some View {
        VStack {
            Picker(selection: $selectedSegment, label: Text("What is your favorite color?")) {

                Text("First View")
                    .tag(0)
                Text("Second View")
                    .tag(1)
                Text("Third View")
                    .tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Spacer()

            if selectedSegment == 0 {
                FirstView()
            } else if selectedSegment == 1 {
                SecondView()
            } else {
                ThirdView()
            }

            Spacer()
        }
    }
}

struct FirstView: View {
    var body: some View {
        Text("First View")
            .font(.largeTitle)
            .padding()
    }
}

struct SecondView: View {
    var body: some View {
        Text("Second View")
            .font(.largeTitle)
            .padding()
    }
}

struct ThirdView: View {
    var body: some View {
        Text("Third View")
            .font(.largeTitle)
            .padding()
    }
}
