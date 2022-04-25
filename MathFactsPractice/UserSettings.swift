//
//  UserSettings.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import Foundation
import SwiftUI

class UserSettings: ObservableObject {
    
    @Published var level: String = "Elementary"
    @Published var addMinNumber: Double = 0
    @Published var addMaxNumber: Double = 10
    @Published var subMinNumber: Double = 0
    @Published var subMaxNumber: Double = 10
    @Published var mulMinNumber: Double = 0
    @Published var mulMaxNumber: Double = 10
    @Published var divMinNumber: Double = 0
    @Published var divMaxNumber: Double = 10
    
    func printUserSettings(){
        print("User Settings")
        print("\(self.level)")
        print("addMinNumber: \(addMinNumber) addMaxNumber: \(addMaxNumber)")
        print("subMinNumber: \(subMinNumber) subMaxNumber: \(subMaxNumber)")
        print("mulMinNumber: \(mulMinNumber) mulMaxNumber: \(mulMaxNumber)")
        print("divMinNumber: \(divMinNumber) divMaxNumber: \(divMaxNumber)")
    }
}
