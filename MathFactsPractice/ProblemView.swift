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
    
    var body: some View {
//        let fontSize = 40
        HStack{
            
            Text("\(mathModel.number1)").foregroundColor(Color.white).font(.custom("Arial", size: fontSize))
            
            if mathModel.problemType == "Addition" {
                Text(" + ").font(.custom("Arial", size: fontSize)).foregroundColor(Color.white)
            } else if mathModel.problemType == "Subtraction" {
                Text(" - ").font(.custom("Arial", size: fontSize)).foregroundColor(Color.white)
            } else if mathModel.problemType == "Multiplication" {
                Text(" X ").font(.custom("Arial", size: fontSize - 5)).foregroundColor(Color.white)
            } else if mathModel.problemType == "Division" {
                Text(" / ").font(.custom("Arial", size: fontSize)).foregroundColor(Color.white)
            }
            
            Text("\(mathModel.number2)").font(.custom("Arial", size: fontSize)).foregroundColor(Color.white)
            
            Text(" = ").font(.custom("Arial", size: fontSize)).foregroundColor(Color.white)
 
            Text("\(answerDisplay)").font(.custom("Arial", size: fontSize)).foregroundColor(Color.red)
            
        }.background(Color.black).padding().cornerRadius(20).shadow(radius: 20)
    }
}

struct ProblemView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemView(mathModel: MathModel(), answerDisplay: .constant("0"),fontSize: 50)
    }
}
