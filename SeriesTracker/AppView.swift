//
//  AppView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 20/10/2023.
//

import SwiftUI

struct AppView: View {
    let persistenceController: PersistenceController
    
    var body: some View {
        NavigationStack {
            ShowsView(
                viewModel: ShowsViewModel(
                    showsRepository: ShowsRepository(
                        persistenceController: persistenceController,
                        showDAO: ShowDAO(),
                        showsMapper: ShowsMapper()
                    )
                )
            )
            .navigationDestination(for: AddShowView.Arguments.self) { _ in
                AddShowView(
                    viewModel: AddShowViewModel(
                        showsRepository: ShowsRepository(
                            persistenceController: persistenceController,
                            showDAO: ShowDAO(),
                            showsMapper: ShowsMapper()
                        )
                    )
                )
            }
            .navigationDestination(for: ShowDetailsView.Arguments.self) { arguments in
                ShowDetailsView(
                    showID: arguments.showID,
                    viewModel: ShowDetailsViewModel(
                        showsRepository: ShowsRepository(
                            persistenceController: persistenceController,
                            showDAO: ShowDAO(),
                            showsMapper: ShowsMapper()
                        )
                    )
                )
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(
            persistenceController: PersistenceController.preview
        )
    }
}
