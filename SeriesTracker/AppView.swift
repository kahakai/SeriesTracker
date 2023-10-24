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
                        showsMapper: ShowsMapper()
                    )
                )
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem {
                    NavigationLink(value: AddShowView.Arguments()) {
                        Label("Add show", systemImage: "plus")
                    }
                }
            }
            .navigationDestination(for: AddShowView.Arguments.self) { _ in
                AddShowView(
                    viewModel: AddShowViewModel(
                        showsRepository: ShowsRepository(
                            persistenceController: persistenceController,
                            showsMapper: ShowsMapper()
                        )
                    )
                )
            }
            .navigationDestination(for: ShowDetailsView.Arguments.self) { arguments in
                ShowDetailsView(
                    show: arguments.show
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
