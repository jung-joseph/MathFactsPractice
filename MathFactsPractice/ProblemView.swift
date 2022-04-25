//
//  Problem.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/12/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct ProblemView: View {
    @ObservedObject var mathModel: MathModel
    @Binding var answerDisplay: String
    var fontSize: CGFloat
    
    var fontColor: Color {
        get {
            if mathModel.problemType == "Addition"{
                return  Color.green
            } else if mathModel.problemType == "Subtraction"{
                return Color.blue
            } else if mathModel.problemType == "Multiplication"{
                return Color.orange
            }  else if mathModel.problemType == "Division" {
                return Color.purple
            }
            return Color.white
        }
    }
    var body: some View {
        //        let fontSize = 40
        //        if mathModel.problemType == "Addition" {
        //            let fontColor = Color.green
        //        }
        HStack{
            
            
            
            Text("\(mathModel.number1)").foregroundColor(fontColor).font(.custom("Arial", size: fontSize))
            
            if mathModel.problemType == "Addition" {
                Text(" + ").font(.custom("Arial", size: fontSize)).foregroundColor(fontColor)
            } else if mathModel.problemType == "Subtraction" {
                Text(" - ").font(.custom("Arial", size: fontSize)).foregroundColor(fontColor)
            } else if mathModel.problemType == "Multiplication" {
                Text(" X ").font(.custom("Arial", size: fontSize - 5)).foregroundColor(fontColor)
            } else if mathModel.problemType == "Division" {
                Text(" / ").font(.custom("Arial", size: fontSize)).foregroundColor(fontColor)
            }
            
//            if mathModel.problemType == "Addition" {
                
                Text("\(mathModel.number2)").font(.custom("Arial", size: fontSize))
                    .foregroundColor(fontColor)
                
                Text(" = ").font(.custom("Arial", size: fontSize))
                    .foregroundColor(fontColor)
                
//            }
            
            Text("\(answerDisplay)").font(.custom("Arial", size: fontSize)).foregroundColor(Color.red)
            
        }
//        .background(Color.black)
//            .overlay(
//                RoundedRectangle(cornerRadius: 15)
//                    .stroke(Color.blue)
//            )
//            .padding()
//            .cornerRadius(50)
//            .shadow(radius: 20)
    }
}

struct ProblemView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemView(mathModel: MathModel(), answerDisplay: .constant("0"),fontSize: 50)
    }
}
