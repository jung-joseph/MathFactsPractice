//
//  AnswerButton.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/13/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct AnswerButton: View {
    @ObservedObject var mathModel: MathModel
    @Binding var answerDisplay: String
    @Binding var rightWrong: String
    @Binding var newProblem: Bool
    
    @Binding var addScore: Int
    @Binding var subScore: Int
    @Binding var mulScore: Int
    @Binding var divScore: Int
    
    @Binding var numAddProblems: Int
    @Binding var numSubProblems: Int
    @Binding var numMulProblems: Int
    @Binding var numDivProblems: Int


//    @Binding var score: Int
    var body: some View {
        Button (action: {
            

            
            
            
            let answerTemp = Int(self.mathModel.answerText)
            if answerTemp == self.mathModel.number3 {
                print("Right")
                self.rightWrong = "Right!"
                self.answerDisplay = String(self.mathModel.number3)
                self.mathModel.answerText = self.rightWrong
                
            } else {
                print("Sorry")
                self.rightWrong = "Sorry!"
                self.answerDisplay = String(self.mathModel.number3)
                self.mathModel.answerText = self.rightWrong
            }
            self.newProblem = false
            
            self.scoreIt()
            
        }){Text("Enter Answer")}
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            .font(.largeTitle)    }
    
    func scoreIt(){
        if self.mathModel.problemType == "Addition" {
            self.numAddProblems += 1
            if self.rightWrong == "Right!" {
                self.addScore += 1
            }
            
        } else if self.mathModel.problemType == "Subtraction" {
            self.numSubProblems += 1
            if self.rightWrong == "Right!"{
            self.subScore += 1
            }
            
        } else if self.mathModel.problemType == "Multiplication" {
            self.numMulProblems += 1
            if self.rightWrong == "Right!"{
                self.mulScore += 1
            }
            
        } else if self.mathModel.problemType == "Division" {
            self.numDivProblems += 1
            if self.rightWrong == "Right!" {
                self.divScore += 1
            }
            
        } else {
            fatalError("Fatal Error")
        }
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(mathModel: MathModel(), answerDisplay: .constant("0"), rightWrong: .constant("0"), newProblem: .constant(true), addScore: .constant(0), subScore: .constant(0), mulScore: .constant(0), divScore: .constant(0), numAddProblems: .constant(1), numSubProblems: .constant(1), numMulProblems: .constant(1), numDivProblems: .constant(1))
    }
}
