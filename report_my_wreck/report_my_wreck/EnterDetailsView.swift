//
//  EnterDetailsView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI

struct EnterDetailsView: View {
    @State private var emailText: String = ""
    @Binding var shouldPopToRootView : Bool
    
    var body: some View {
        
        Form {
            Section(header: Text("Compose email")){
                TextEditor(text: $emailText)
            }
            Section(header: Text("Attach Photos")){
                Button(action:{}){
                    Text("Select Photo")
                }
            }
            Button (action: { self.shouldPopToRootView = false } ){
                Text("Return to main page")
            }
        }
        
    }
}

struct EnterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EnterDetailsView(shouldPopToRootView: .constant(false))
    }
}
