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
    
    
    var min: Double = -50
    var max: Double = 50
    
    var body: some View {
        
        //        NavigationView {
        VStack{
            
            Button(action:{
                userSettings.level = "Elementary"
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
                   label: {Text("Elementary Level")})
            .background(Color.red)
            .foregroundColor(Color.white)
            .padding(.horizontal, 4)
            .cornerRadius(10)
            .shadow(radius: 10)
            .font(.custom("Arial", size: 18))
            .padding()
            
            Button(action:{
                userSettings.level = "High School"
                userSettings.addMinNumber = 0
                userSettings.addMaxNumber = 12
                
                userSettings.subMinNumber = -12
                userSettings.subMaxNumber = 12
                
                userSettings.mulMinNumber = -12
                userSettings.mulMaxNumber = 12
                
                userSettings.divMinNumber = -12
                userSettings.divMaxNumber = 12
                
                userSettings.printUserSettings()
                
            },
                   label: {Text("High School Level")})
            .background(Color.green)
            .foregroundColor(Color.white)
            .padding(.horizontal, 4)
            .cornerRadius(10)
            .shadow(radius: 10)
            .font(.custom("Arial", size: 18))
            
            Spacer()
            
            Group{
                Text("Elementary Level:")
                Text("Addends, minuends, subtrahends, multiplicands, multipliers, divisors, and quotients are between 0 and 10.")
                Text("In addition, the minuend is greater than or equal to the subtrahend so there are no negative differences.")
            }
            .foregroundColor(Color.red)
            Group{
                Text("High School Level:")
                Text("Addends, minuends, subtrahends, multiplicands, multipliers, divisors, and quotients are between -12 and 12.")
            }
            .foregroundColor(Color.green)
            Group{
                Text("Note:")
                Text("Users are allowed to change these levels only at the start of using the app or after resetting the scores.")
            }
            
            Spacer()
            
            
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
