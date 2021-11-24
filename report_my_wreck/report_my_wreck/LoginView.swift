//
//  LoginView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI

struct LoginView: View {
    @State private var userName: String = ""
    @State private var password: String = "!@##$%^&"
    @State private var validated: Bool = false
    @Binding var rootIsActive : Bool
    @State private var badPassword: Bool = false
    
    var body: some View {
        if getStoredPassword() == "" {
            NavigationLink(destination: MapView(rootIsActive: $rootIsActive), isActive: $validated){}.hidden()
            Form {
                Section(header: Text("Set Password")){
                    SecureField("PASSWORD", text: $password)
                }
                
                Text("SET PASSWORD")
                    .onTapGesture {
                        updatePassword(password: password)
                        validated = validatePassword(password: password)
                    }
                }
        }
        else {
            NavigationLink(destination: MapView(rootIsActive: $rootIsActive), isActive: $validated){
            }.hidden()
            Form {
                Section(header: Text("Enter Your Password")){
                    SecureField("PASSWORD", text: $password)
                }
                Text("SIGN IN")
                    .onTapGesture {
                        //DELETE password for dev. purposes only
                        if password == "..." {
                            let kcw = KeychainWrapper()
                            do {
                                try kcw.deleteGenericPasswordFor(
                                    account: "ReportMyWreck",
                                    service: "unlockPassword")
                            } catch {
                                print("Error occurred while setting password")
                            }
                        }
                        validated = validatePassword(password: password)
                        if !validated {
                            badPassword = true
                        }
                    }
            }.alert(isPresented: $badPassword){
                Alert(
                    title: Text("PASSWORD ERROR"),
                    message: Text("Incorrect password was entered. Enter '...' to reset."),
                    dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    func validatePassword(password: String) -> Bool{
        return getStoredPassword() == password
    }
    func getStoredPassword() -> String{
        let kcw = KeychainWrapper()
        if let storedPassword = try? kcw.getGenericPasswordFor(
            account: "ReportMyWreck",
            service: "unlockPassword"){
            return storedPassword
        }
        return ""
    }
    func updatePassword(password: String){
        let kcw = KeychainWrapper()
        do {
            try kcw.storeGenericPasswordFor(
                account: "ReportMyWreck",
                service: "unlockPassword",
                password: password)
        } catch {
            print("Error occurred while setting password")
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(rootIsActive: .constant(false))
    }
}
