//
//  SeriesTrackerApp.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 18/10/2023.
//

import SwiftUI

@main
struct SeriesTrackerApp: App {
    private let dependenciesContainer = DependenciesContainer()

    var body: some Scene {
        WindowGroup {
            AppView(
                dependenciesContainer: dependenciesContainer
            )
        }
    }
}
