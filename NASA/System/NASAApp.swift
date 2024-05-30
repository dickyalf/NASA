//
//  NASAApp.swift
//  NASA
//
//  Created by Dicky Al Fayed on 17/05/24.
//

import SwiftUI
import SwiftData

@main
struct NASAApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    
    @StateObject var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(locationManager)
        }.onChange(of: scenePhase) { _ in
            persistenceController.saveContext()
        }
    }
}
