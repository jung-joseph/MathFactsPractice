//
//  Comms.swift
//  MathFactsPractice
//
//  Created by Joseph Jung on 4/20/22.
//

import Foundation
import SwiftUI
import UIKit
import MessageUI


class MessageToMail: ObservableObject {
    @Published var message1: String = "I worked on Math Today"
}

struct MailView: UIViewControllerRepresentable {

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    @ObservedObject var messages: MessageToMail
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setSubject("My Math Practice Results")
        let message = "My Results are:\r \(messages.message1)"
        vc.setMessageBody("\(message)", isHTML: false)
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}


struct MessageView: UIViewControllerRepresentable {
    
    

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MessageComposeResult, Error>?
    @ObservedObject var messages: MessageToMail

    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MessageComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MessageComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            // add code here
            switch (result) {
            case .cancelled:
                print("Message was cancelled")
                $presentation.wrappedValue.dismiss()
                //                dismiss(animated: true, completion: nil)
            case .failed:
                print("Message failed")
                $presentation.wrappedValue.dismiss()
                
                //                dismiss(animated: true, completion: nil)
            case .sent:
                print("Message was sent")
                $presentation.wrappedValue.dismiss()
                
                //                dismiss(animated: true, completion: nil)
            default:
                break
            }
            
        }
        
        func messageComposeController(_ controller: MFMessageComposeViewController,
                                   didFinishWith result: MessageComposeResult,
                                   error: Error?) {
            

            
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MessageView>) -> MFMessageComposeViewController {
        let vc = MFMessageComposeViewController()
        vc.messageComposeDelegate = context.coordinator
        vc.body = """
        My Math Results are:
        \(messages.message1)
        """
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMessageComposeViewController,
                                context: UIViewControllerRepresentableContext<MessageView>) {

    }
}
