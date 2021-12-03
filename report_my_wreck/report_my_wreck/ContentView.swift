//
//  ContentView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//
import SwiftUI
import CoreData

struct ContentView: View {
    @State var isActive : Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("bg_color")
                    .ignoresSafeArea(.all, edges: .all)
            VStack{
                Text("Report My Wreck")
                    .font(.custom("Alatsi-Regular", size: 45))
                    .fontWeight(.bold)
                    .italic()
                    .foregroundColor(Color("title_color"))
                    .padding(-60)
            
            VStack{
                Image("Main")
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 250, alignment: .center)
                        .padding(.bottom, 60)
                    
            NavigationLink(destination: LoginView(rootIsActive: self.$isActive),
                           isActive: self.$isActive
            ) {
                Text("Get Started")
                    .font(.custom("Alatsi-Regular", size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("button_color"))
                    .cornerRadius(50)
                }
            .isDetailLink(false)
            }
                .padding(90)
                }
            }
        }
    }
}
  
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
