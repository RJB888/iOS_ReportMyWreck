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
                .bold()
                .frame(width: 250,
                       height: 50,
                       alignment: .center)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
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

