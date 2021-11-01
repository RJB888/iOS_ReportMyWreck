//
//  LoginView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI

struct LoginView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Username")){
                TextField("USERNAME", text: $userName)
            }
            Section(header: Text("Password")){
                SecureField("PASSWORD", text: $password)
            }
            Button(action:{}){
                Text("SUBMIT")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
