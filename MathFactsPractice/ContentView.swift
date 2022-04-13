//
//  ContentView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/12/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userSettings = UserSettings()
    @ObservedObject var mathModel = MathModel()
    
    @State private var rightWrong: String = ""
    @State private var answerDisplay: String = "??"
    
    @State private var addScore: Int = 0
    @State private var subScore: Int = 0
    @State private var mulScore: Int = 0
    @State private var divScore: Int = 0
    
    @State private var numAddProblems: Int = 0
    @State private var numSubProblems: Int = 0
    @State private var numMulProblems: Int = 0
    @State private var numDivProblems: Int = 0
    
    @State private var newProblem: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        mathModel.initialize(userSettings: userSettings)
    }
    
    var body: some View {
        
        
        NavigationView{
            ZStack{
                //Define the screen Color
                Color.black
                    // Extend the screen to all edges
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    ProblemButtonsScores(userSettings: userSettings, mathModel: mathModel, answerDisplay: $answerDisplay, addScore: $addScore, subScore: $subScore, mulScore: $mulScore, divScore: $divScore, numAddProblems: $numAddProblems, numSubProblems: $numSubProblems, numMulProblems: $numMulProblems, numDivProblems: $numDivProblems)
                    
                    ProblemView(mathModel: mathModel, answerDisplay: $answerDisplay,fontSize: 50)
                    
                    
                    TextField("Answer", text: $mathModel.answerText).textFieldStyle(RoundedBorderTextFieldStyle()).padding().font(.custom("Arial", size: 40)).foregroundColor(Color.red)
                        .keyboardType(.numbersAndPunctuation)
                    
                    AnswerButton(mathModel: mathModel, answerDisplay: $answerDisplay, rightWrong: $rightWrong, newProblem: $newProblem, addScore: $addScore, subScore: $subScore, mulScore: $mulScore, divScore: $divScore, numAddProblems: $numAddProblems, numSubProblems: $numSubProblems, numMulProblems: $numMulProblems, numDivProblems: $numDivProblems)
                    
                    
                    Text("Double Tap Anywhere For the Next Problem")
                        .font(.body)
                        .foregroundColor(Color.white)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    
                    
                }// VStack
                
            } // ZStack
                .navigationBarItems(trailing: SettingsButton(destination: UserSettingsView(userSettings: userSettings))).foregroundColor(Color.white)
                
                .navigationBarTitle("MathFacts!")
            
        }// NavigationView
            .onTapGesture(count: 2){
                print("Tapped!")
                if self.mathModel.problemType == "Addition" {
                    self.mathModel.addition(userSettings: self.userSettings)
                } else if self.mathModel.problemType == "Subtraction" {
                    self.mathModel.subtraction(userSettings: self.userSettings)
                } else if self.mathModel.problemType == "Multiplication" {
                    self.mathModel.multiplication(userSettings: self.userSettings)
                } else if self.mathModel.problemType == "Division" {
                    self.mathModel.division(userSettings: self.userSettings)
                } else {
                    fatalError("Fatal Error")
                }
                
                self.answerDisplay = "??"
                self.mathModel.answerText = ""
                self.newProblem = true
                self.rightWrong = ""
        }
        
        
    }
}// ContentView
    
    struct SettingsButton<Destination : View>: View {
        var destination: Destination
        
        var body: some View {
            NavigationLink(destination: self.destination){Text("⚙︎").font(.largeTitle)}
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
