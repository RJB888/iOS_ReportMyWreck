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
        
        ZStack{
            Color("bg_color")
                .ignoresSafeArea(.all, edges: .all)
            VStack{
            Text("Please Login")
                .font(.custom("Alatsi-Regular", size: 50))
                .fontWeight(.bold)
                .italic()
                .foregroundColor(Color("title_color"))
                .padding(-100)
            VStack{
                    Image("Main")
                        .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250, alignment: .center)
                            .padding(.bottom, 60)
            
        if getStoredPassword() == "" {
            
            NavigationLink(destination: MapHome(rootIsActive: $rootIsActive), isActive: $validated){}.hidden()
            
            Form {
                Section(){
                    SecureField("PASSWORD", text: $password)
                }.padding()
                Text("SET PASSWORD")
                    .onTapGesture {
                        updatePassword(password: password)
                        validated = validatePassword(password: password)
                            
                        
                    }.padding()
                
            
                
            }
                .frame(width: 340, height: 230, alignment: .center)
                .cornerRadius(40)
        
        }
        else {
            NavigationLink(destination: MapHome(rootIsActive: $rootIsActive), isActive: $validated){
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
                            }.frame(width: 340, height: 230, alignment: .center)
                .cornerRadius(40)
                        }
                    }
                }
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



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(rootIsActive: .constant(false))
    }
}
