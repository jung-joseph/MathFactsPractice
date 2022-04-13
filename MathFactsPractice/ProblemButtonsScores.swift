//
//  ProblemButtonsScores.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/16/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct ProblemButtonsScores: View {
    @ObservedObject var userSettings = UserSettings()
    @ObservedObject var mathModel = MathModel()
    
    @Binding var answerDisplay: String
    @Binding var addScore: Int
    @Binding var subScore: Int
    @Binding var mulScore: Int
    @Binding var divScore: Int
    
    @Binding var numAddProblems: Int
    @Binding var numSubProblems: Int
    @Binding var numMulProblems: Int
    @Binding var numDivProblems: Int
    
    var body: some View {
        HStack{
            VStack{
                Button (action: {
                    self.mathModel.problemType = "Addition"
                    self.mathModel.initialize(userSettings: self.userSettings)
                    self.answerDisplay = "??"
                    self.mathModel.answerText = ""
                }){Text("Addition")}
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .font(.custom("Arial", size: 20))
                
                Text("Score: \(addScore) / \(numAddProblems)")
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(Color.white)
            }
            VStack {
                Button (action: {
                    self.mathModel.problemType = "Subtraction"
                    self.mathModel.initialize(userSettings: self.userSettings)
                    self.answerDisplay = "??"
                    self.mathModel.answerText = ""
                }){Text("Subtraction")}
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .font(.custom("Arial", size: 20))
                
                Text("Score: \(subScore) / \(numSubProblems)")
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(Color.white)
                
            }
            VStack{
                Button (action: {
                    self.mathModel.problemType = "Multiplication"
                    self.mathModel.initialize(userSettings: self.userSettings)
                    self.answerDisplay = "??"
                    self.mathModel.answerText = ""
                }){Text("Multiplication")}
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .font(.custom("Arial", size: 20))
                
                Text("Score: \(mulScore) / \(numMulProblems)")
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(Color.white)
            }
            
            VStack {
                Button (action: {
                    self.mathModel.problemType = "Division"
                    self.mathModel.initialize(userSettings: self.userSettings)
                    self.answerDisplay = "??"
                    self.mathModel.answerText = ""
                }){Text("Division")}
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .font(.custom("Arial", size: 20))
                
                Text("Score: \(divScore) / \(numDivProblems)")
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(Color.white)
                
            }
        }    }
}

struct ProblemButtonsScores_Previews: PreviewProvider {
    static var previews: some View {
        ProblemButtonsScores(userSettings: UserSettings(), mathModel: MathModel(), answerDisplay: .constant("0"), addScore: .constant(0), subScore: .constant(0), mulScore: .constant(0), divScore: .constant(0), numAddProblems: .constant(0), numSubProblems: .constant(0), numMulProblems: .constant(0), numDivProblems: .constant(0))
    }
}
