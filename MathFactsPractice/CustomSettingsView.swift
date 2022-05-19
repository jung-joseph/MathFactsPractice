//
//  CustomSettingsView.swift
//  MathFactsPractice
//
//  Created by Joseph Jung on 4/26/22.
//

import SwiftUI

struct CustomSettingsView: View {
    @ObservedObject var userSettings: UserSettings
    @Environment(\.dismiss) var dismiss
    
    var min: Double = -50
    var max: Double = 50
    
    var body: some View {
        VStack{
            
            Text("Custom Settings")
                .foregroundColor(Color.blue)
                .font(.title)
            AddSettingsView(userSettings: userSettings, min: min, max: max)
            
            SubSettingsView(userSettings: userSettings, min: min, max: max)
            
            MulSettingsView(userSettings: userSettings, min: min, max: max)
            
            DivSettingsView(userSettings: userSettings, min: min, max: max)
            
            
            Button("Done") {
                userSettings.printUserSettings()
                // check userSettings
                if userSettings.addMinNumber > userSettings.addMaxNumber {
                    let temp = userSettings.addMinNumber
                    userSettings.addMinNumber = userSettings.addMaxNumber
                    userSettings.addMaxNumber = temp
                }
                if userSettings.subMinNumber > userSettings.subMaxNumber {
                    let temp = userSettings.subMinNumber
                    userSettings.subMinNumber = userSettings.subMaxNumber
                    userSettings.subMaxNumber = temp
                }
                if userSettings.mulMinNumber > userSettings.mulMaxNumber {
                    let temp = userSettings.mulMinNumber
                    userSettings.mulMinNumber = userSettings.mulMaxNumber
                    userSettings.mulMaxNumber = temp
                }
                if userSettings.divMinNumber > userSettings.divMaxNumber {
                    let temp = userSettings.divMinNumber
                    userSettings.divMinNumber = userSettings.divMaxNumber
                    userSettings.divMaxNumber = temp
                }
                userSettings.printUserSettings()

                dismiss()
            }
            .background(Color.green)
            .foregroundColor(Color.white)
            .padding(.horizontal, 4)
            .cornerRadius(10)
            .shadow(radius: 10)
            .font(.custom("Arial", size: 18))
            .padding()
        }
    }
}

struct CustomSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSettingsView(userSettings: UserSettings())
    }
}
