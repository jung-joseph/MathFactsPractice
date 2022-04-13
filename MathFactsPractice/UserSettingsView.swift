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
                Spacer()
                AddSettingsView(userSettings: userSettings, min: min, max: max)
                
                SubSettingsView(userSettings: userSettings, min: min, max: max)
                
                MulSettingsView(userSettings: userSettings, min: min, max: max)
                
                DivSettingsView(userSettings: userSettings, min: min, max: max)
                
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
