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
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        mathModel.initialize(userSettings: userSettings)
    }
    
    var body: some View {
        
        
        NavigationView{
            ZStack{
                //Define the screen Color
                Color.white
                // Extend the screen to all edges
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    ProblemButtonsScores(userSettings: userSettings, mathModel: mathModel, answerDisplay: $answerDisplay, addScore: $addScore, subScore: $subScore, mulScore: $mulScore, divScore: $divScore, numAddProblems: $numAddProblems, numSubProblems: $numSubProblems, numMulProblems: $numMulProblems, numDivProblems: $numDivProblems)
                    
                    Button (action:{
                        addScore = 0
                        numAddProblems = 0
                        subScore = 0
                        numSubProblems = 0
                        mulScore = 0
                        numMulProblems = 0
                        divScore = 0
                        numDivProblems = 0
                    }){Text("Reset Scores")}
                        .background(Color.yellow)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .font(.custom("Arial", size: 18))
                    
                    Spacer()
                        .frame(height: 25)
                    
                    ProblemView(mathModel: mathModel, answerDisplay: $answerDisplay,fontSize: 50)
                    
                    
                    TextField("Answer(tap for keyboard)", text: $mathModel.answerText).textFieldStyle(RoundedBorderTextFieldStyle()).padding().font(.custom("Arial", size: 25)).foregroundColor(Color.red)
                        .keyboardType(.numbersAndPunctuation)
                    
                    AnswerButton(mathModel: mathModel, answerDisplay: $answerDisplay, rightWrong: $rightWrong, newProblem: $newProblem, addScore: $addScore, subScore: $subScore, mulScore: $mulScore, divScore: $divScore, numAddProblems: $numAddProblems, numSubProblems: $numSubProblems, numMulProblems: $numMulProblems, numDivProblems: $numDivProblems)
                    
                    
                    Text("Double Tap Anywhere For the Next Problem")
                        .font(.body)
                        .foregroundColor(Color.pink)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    
                    
                }// VStack
                
            } // ZStack
            //
            .navigationBarTitle("MathFacts!")
            
            //
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    
                    SettingsButton(destination: UserSettingsView(userSettings: userSettings))
                        .foregroundColor(Color.blue)
                        .disabled(!(numAddProblems + numSubProblems + numMulProblems + numDivProblems == 0))
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    
                    CommunicationsButton(destination: CommunicationsView(addScore: addScore, numAddProblems: numAddProblems, subScore: subScore, numSubProblems: numSubProblems, mulScore: mulScore, numMulProblems: numMulProblems, divScore: divScore, numDivProblems: numDivProblems, level: userSettings.level) )
                        .foregroundColor(Color.blue)
                }
                
                
            }// toolbar
            
            
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
        HStack{
            NavigationLink(destination: self.destination){Image(systemName:"gear")}
        }
    }
}

struct CommunicationsButton<Destination: View>: View {
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination:
                        self.destination){Image(systemName: "square.and.arrow.up")}
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
