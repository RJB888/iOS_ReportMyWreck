//
//  EnterDetailsView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI

struct EnterDetailsView: View {
    @State private var emailText: String = ""
    var body: some View {

        Text("Enter details for email")
        NavigationView {
            NavigationLink(destination: ContentView()) {
                Text("Send Email")
            }
        }

        Form {
            Section(header: Text("Compose email")){
                TextEditor(text: $emailText)
            }
            Section(header: Text("Attach Photos")){
                Button(action:{}){
                    Text("Select Photo")
                }
            }
            
        }
       
    }
}

struct EnterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EnterDetailsView()
    }
}
