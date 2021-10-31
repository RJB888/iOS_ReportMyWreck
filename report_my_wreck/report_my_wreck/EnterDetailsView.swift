//
//  EnterDetailsView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI

struct EnterDetailsView: View {
    var body: some View {
        Text("Enter details for email")
        NavigationView {
            NavigationLink(destination: ContentView()) {
                Text("Send Email")
            }
        }
    }
}

struct EnterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EnterDetailsView()
    }
}
