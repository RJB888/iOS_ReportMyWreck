//
//  MapView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        Text("maps incoming")
        NavigationView {
            NavigationLink(destination: EnterDetailsView()) {
                Text("Next Page")
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapView()
        }
    }
}
