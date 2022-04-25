//
//  CommunicationsView.swift
//  MathFactsPractice
//
//  Created by Joseph Jung on 4/18/22.
//

import SwiftUI
import MessageUI

struct CommunicationsView: View {
    
    @State var resultMail: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var resultMessage: Result<MessageComposeResult, Error>? = nil
    @State var isShowingMessageView = false
    @ObservedObject var transferMessage = MessageToMail()
    var addScore: Int
    var numAddProblems: Int
    var subScore: Int
    var numSubProblems: Int
    var mulScore: Int
    var numMulProblems: Int
    var divScore: Int
    var numDivProblems: Int
    var level: String
    
    var body: some View {
        HStack{
            Spacer()
            
            Button(action: {
                self.isShowingMailView.toggle()
                transferMessage.message1 = """
                addition: \(addScore)/\(numAddProblems)
                subtraction:\(subScore)/\(numSubProblems)
                multiplcation:\(mulScore)/\(numMulProblems)
                division:\(divScore)/\(numDivProblems)
                
                Difficult Level: \(level)
                """
            }) {
            
            Image(systemName: "envelope.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
            }
            .disabled(!MFMailComposeViewController.canSendMail())
            .sheet(isPresented: $isShowingMailView) {
                MailView(result: self.$resultMail, messages: transferMessage)
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                self.isShowingMessageView.toggle()
                transferMessage.message1 =
                """
                addition: \(addScore)/\(numAddProblems)
                subtraction: \(subScore)/\(numSubProblems)
                multiplcation:\(mulScore)/\(numMulProblems)
                division: \(divScore)/\(numDivProblems)
                                
                Difficult Level: \(level)
                """
            }) {
            Image(systemName: "text.bubble.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
            }
            .disabled(!MFMessageComposeViewController.canSendText())
            .sheet(isPresented: $isShowingMessageView) {
                MessageView(result: self.$resultMessage, messages: transferMessage)
            }
            
            Spacer()
        }
    }
}

struct CommunicationsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunicationsView(addScore: 2, numAddProblems: 2,subScore: 2, numSubProblems: 2,mulScore: 2,numMulProblems: 2, divScore: 2,numDivProblems: 2, level: "Elementry")
    }
}
