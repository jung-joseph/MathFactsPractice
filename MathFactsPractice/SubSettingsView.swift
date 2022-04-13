//
//  SubSettingsView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct SubSettingsView: View {
    @ObservedObject var userSettings: UserSettings
    var min: Double
    var max: Double
    var body: some View {
        VStack{
            HStack{
                Text("Subtraction min value").foregroundColor(Color.green)
                Text("\(Int(userSettings.subMinNumber))").foregroundColor(Color.green)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.green)
                Slider(value: $userSettings.subMinNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.green)

            }
            HStack{
                Text("Subtraction max value").foregroundColor(Color.green)
                Text("\(Int(userSettings.subMaxNumber))").foregroundColor(Color.green)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.green)
                Slider(value: $userSettings.subMaxNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.green)

            }
            
            
        }
    }
}

struct SubSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SubSettingsView(userSettings: UserSettings(), min: 0, max: 0)
    }
}
