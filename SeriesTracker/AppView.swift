//
//  AppView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 20/10/2023.
//

import SwiftUI

struct AppView: View {
    let dependenciesContainer: DependenciesContainer
    
    var body: some View {
        NavigationStack {
            ShowsView(
                viewModel: dependenciesContainer.showsViewModel
            )
            .navigationDestination(for: AddShowView.Arguments.self) { _ in
                AddShowView(
                    viewModel: dependenciesContainer.addShowViewModel
                )
            }
            .navigationDestination(for: ShowDetailsView.Arguments.self) { arguments in
                ShowDetailsView(
                    showID: arguments.showID,
                    viewModel: dependenciesContainer.showDetailsViewModel
                )
            }
            .navigationDestination(for: EditShowDetailsView.Arguments.self) { arguments in
                EditShowDetailsView(
                    showID: arguments.showID,
                    viewModel: dependenciesContainer.editShowDetailsViewModel
                )
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(
            dependenciesContainer: DependenciesContainer()
        )
    }
}
