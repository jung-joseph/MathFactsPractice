//
//  DivSettingsView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct DivSettingsView: View {
    @ObservedObject var userSettings: UserSettings
    var min: Double
    var max: Double
    var body: some View {
        VStack{
            HStack{
                Text("Division min value").foregroundColor(Color.purple)
                Text("\(Int(userSettings.divMinNumber))").foregroundColor(Color.purple)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.purple)
                Slider(value: $userSettings.divMinNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.purple)
                
            }
            HStack{
                Text("Division max value").foregroundColor(Color.purple)
                Text("\(Int(userSettings.divMaxNumber))").foregroundColor(Color.purple)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.purple)
                Slider(value: $userSettings.divMaxNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.purple)
                
            }
            Spacer()
            
            
        }
    }
}

struct DivSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        DivSettingsView(userSettings: UserSettings(), min: 0, max: 0)
    }
}
