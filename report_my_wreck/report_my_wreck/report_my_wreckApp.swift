//
//  report_my_wreckApp.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI

@main
struct report_my_wreckApp: App {
    // into heirarchy 
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) {(newScenePhase) in
            switch newScenePhase {
            case .background:
                print("scene in background")
                //persistenceController.save()
            case .inactive:
                print("scene is inactive")
            case .active:
                print("scene is active")
            @unknown default:
                print("na")
            }
        }
}
}
