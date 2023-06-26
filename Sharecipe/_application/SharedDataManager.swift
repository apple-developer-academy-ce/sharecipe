//
//  SharedDataManager.swift
//  Sharecipe
//
//  Created by Tales Valente on 21/06/23.
//

import Foundation
import Combine
import SwiftUI

class SharedDataManager: ObservableObject {
    static let shared = SharedDataManager()

    @Published var targetTime: Date = Date()

    //For Page Persistance
    @Published var buttonPressed: Bool = false
    @Published var selectedButtonID: UUID? = nil

    //For Recipe Persistance
    @Published var recipe: Recipe? = nil  // This will hold your current recipe


    private init() {}

    func setTargetTime(minutes: Int) {
        self.targetTime = Calendar.current.date(byAdding: .minute, value: minutes, to: Date())!
    }
    
    // this function will return the remaining time in seconds
    func remainingTime() -> Int {
        let remaining = Int(targetTime.timeIntervalSince(Date()))
        return max(0, remaining) // prevent it from returning negative values
    }

    // Function to format and return targetTime as string
    func getFormattedTargetTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM, yyyy - HH:mm:ss"
        formatter.timeZone = TimeZone.current

        let localTime = formatter.string(from: self.targetTime)

        //For Debug Only
        print("[DEBUG / SharedDataManager.swift]: Scheduling Notification \(localTime)\n")

        return localTime
    }

    func setButtonPressed(isPressed: Bool) {
        self.buttonPressed = isPressed
    }

    func setSelectedButtonID(id: UUID?) {
        self.selectedButtonID = id
    }

    func setRecipe(recipe: Recipe?) {
        self.recipe = recipe
    }

    // In SharedDataManager
    func formattedInstructionText(for instruction: Instruction, condition: Int) -> some View {
        switch condition {
        case 1:
            return AnyView(Text("\(instruction.step)")
                .font(.subheadline)
                .fontWeight(.regular)
            )
        case 2:
            return AnyView(Text("\(instruction.step)")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(.blue)
            )
        case 3:
            return AnyView(Text("\(instruction.step)")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.red)
            )
        case 4:
            return AnyView(Text("\(instruction.step)")
                .font(.subheadline)
                .fontWeight(.regular)
            )
        default:
            return AnyView(Text("\(instruction.step)")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(.blue)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .scaleEffect(1)
                .animation(.easeInOut, value: condition == 0))
        }
    }

    func getAlert(for instruction: Instruction) -> Alert {
        Alert(title: Text("Você iniciou um preparo!"),
              message: Text("Este estágio ficará pronto em \(instruction.time) minuto(s)."),
              dismissButton: .default(Text("Ok!"))
        )
    }



}
