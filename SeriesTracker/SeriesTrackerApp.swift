//
//  SeriesTrackerApp.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 18/10/2023.
//

import SwiftUI

@main
struct SeriesTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
