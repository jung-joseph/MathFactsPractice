//
//  RightWrongView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/13/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct RightWrongView: View {
    @Binding var rightWrong: String
    var body: some View {
        if rightWrong == "Right!" {
             return Text("\(rightWrong)").foregroundColor(Color.green).font(.largeTitle)
        } else {
            return Text("\(rightWrong)").foregroundColor(Color.red).font(.largeTitle)
        }    }
}

struct RightWrongView_Previews: PreviewProvider {
    static var previews: some View {
        RightWrongView(rightWrong: .constant("0"))
    }
}
