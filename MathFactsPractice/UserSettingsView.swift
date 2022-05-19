//
//  UserSettingsView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct UserSettingsView: View {
    
    @ObservedObject var userSettings: UserSettings
    @State private var showingSheet = false
    
    var min: Double = -50
    var max: Double = 50
    
    var body: some View {
        
        //        NavigationView {
        VStack{
            
            Button(action:{
                userSettings.level = "Level 1"
                userSettings.addMinNumber = 0
                userSettings.addMaxNumber = 10
                
                userSettings.subMinNumber = 0
                userSettings.subMaxNumber = 10
                
                userSettings.mulMinNumber = 0
                userSettings.mulMaxNumber = 10
                
                userSettings.divMinNumber = 0
                userSettings.divMaxNumber = 10
                
                userSettings.printUserSettings()
                
            },
                   label: {Text("Level 1")})
            .background(Color.red)
            .foregroundColor(Color.white)
            .padding(.horizontal, 4)
            .cornerRadius(10)
            .shadow(radius: 10)
            .font(.custom("Arial", size: 18))
            .padding()
            
            Button(action:{
                userSettings.level = "Level 2"
                userSettings.addMinNumber = -12
                userSettings.addMaxNumber = 12
                
                userSettings.subMinNumber = -12
                userSettings.subMaxNumber = 12
                
                userSettings.mulMinNumber = -12
                userSettings.mulMaxNumber = 12
                
                userSettings.divMinNumber = -12
                userSettings.divMaxNumber = 12
                
                userSettings.printUserSettings()
                
            },
                   label: {Text("Level 2")})
            .background(Color.green)
            .foregroundColor(Color.white)
            .padding(.horizontal, 4)
            .cornerRadius(10)
            .shadow(radius: 10)
            .font(.custom("Arial", size: 18))
            .padding()
            
            Button(action: {
                userSettings.level = "Custom Settings"
                showingSheet.toggle()
                userSettings.printUserSettings()

            }, label: {Text("Custom Settings") })
//            Button("Custom Settings"){
//                showingSheet.toggle()
//            }
            .sheet(isPresented: $showingSheet) {
                CustomSettingsView(userSettings: userSettings)
            }
            .background(Color.blue)
            .foregroundColor(Color.white)
            .padding(.horizontal, 4)
            .cornerRadius(10)
            .shadow(radius: 10)
            .font(.custom("Arial", size: 18))
            
            Spacer()
            
            Group{
                Text("Level 1:")
                Text("Addends, minuends, subtrahends, multiplicands, multipliers, divisors, and quotients are between 0 and 10.")
                Text("The minuend is greater than or equal to the subtrahend so there are no negative differences.")
            }
            .foregroundColor(Color.red)
            Group{
                Text("Level 2:")
                Text("Addends, minuends, subtrahends, multiplicands, multipliers, divisors, and quotients are between -12 and 12.")
            }
            .foregroundColor(Color.green)
            Group{
                Text("Note:")
                Text("Users are allowed to change these levels only at the start of using the app or after resetting the scores.")
            }
            
            Spacer()
            //                AddSettingsView(userSettings: userSettings, min: min, max: max)
            //
            //                SubSettingsView(userSettings: userSettings, min: min, max: max)
            //
            //                MulSettingsView(userSettings: userSettings, min: min, max: max)
            //
            //                DivSettingsView(userSettings: userSettings, min: min, max: max)
            
        }
        //        .navigationBarTitle(Text("User Settings"))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        //                .edgesIgnoringSafeArea(.all)
        
        //        }
    }
}
#if DEBUG
struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView(userSettings: UserSettings())
    }
}
#endif
