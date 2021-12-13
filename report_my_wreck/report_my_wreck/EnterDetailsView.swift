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
        ZStack{
            Color("bg_color")
                .ignoresSafeArea(.all, edges: .all)
        VStack{
            Text("Please Import Details")
                .font(.custom("Alatsi-Regular", size: 35))
                .fontWeight(.bold)
                .italic()
                .foregroundColor(Color("title_color"))
                .padding(3)
                .offset(y:-40)
        VStack{
                Image("Main")
                    .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200, alignment: .center)
                            .padding(.bottom, 20)
                            .offset(y:-20)
            
        Form {
            
            Section(header: Text("Compose email")){
                TextEditor(text: $emailText)
            }
            Section(header: Text("Attach Photos")){
                Button(action:{}){
                    Text("Select Photo")
                }.padding()
            }
            Button (action: { self.shouldPopToRootView = false } ){
                Text("Return to main page")
            }.padding()
        } .frame(width: 350, height: 360, alignment: .center)
                    .cornerRadius(40)
                
            }
            }
        }
    }
}

struct EnterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EnterDetailsView(shouldPopToRootView: .constant(false))
    }
}
