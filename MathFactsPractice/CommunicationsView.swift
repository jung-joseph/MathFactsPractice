//
//  CommunicationsView.swift
//  MathFactsPractice
//
//  Created by Joseph Jung on 4/18/22.
//

import SwiftUI

struct CommunicationsView: View {
    var body: some View {
        HStack{
            Image(systemName: "envelope.fill")
            Image(systemName: "text.bubble.fill")
        }
    }
}

struct CommunicationsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunicationsView()
    }
}
