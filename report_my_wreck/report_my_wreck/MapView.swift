//
//  MapView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI

struct MapView: View {
    @Binding var rootIsActive : Bool
    var body: some View {
        Text("maps incoming")
        NavigationLink(destination: EnterDetailsView(shouldPopToRootView: self.$rootIsActive)) {
            Text("Next Page")
        }
        .isDetailLink(false)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapView(rootIsActive: .constant(false))
        }
    }
}
