//
//  MapView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI

struct MapHome: View {
    
    
    
    @Binding var rootIsActive : Bool
    
    var locationManager = LocationManager()
    
    var body: some View {
        VStack{
            
            //MAp...
            
        MapView()
            .ignoresSafeArea(.all, edges: .all)
            
            //Button...
            
        NavigationLink(destination: EnterDetailsView(shouldPopToRootView: self.$rootIsActive)) {
            Text("Next Page")
                .font(.custom("Alatsi-Regular", size: 30))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 230,
                       height: 40,
                       alignment: .center)
                .padding(5)
                .background(Color("button_color"))
                .cornerRadius(50)
        }
        .isDetailLink(false)
        }
    }
}

struct MapHome_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapHome(rootIsActive: .constant(false))
        }
    }
}

