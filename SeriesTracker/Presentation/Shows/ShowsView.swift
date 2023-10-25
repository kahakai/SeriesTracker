//
//  ShowsView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 19/10/2023.
//

import SwiftUI

struct ShowsView: View {
    @StateObject
    var viewModel: ShowsViewModel

    var body: some View {
        VStack {
            switch viewModel.uiState {
            case .loading:
                ProgressView()
                    .controlSize(.large)
            case let .success(shows):
                List {
                    ForEach(shows) { show in
                        NavigationLink(
                            value: ShowDetailsView.Arguments(
                                showID: show.id
                            )
                        ) {
                            Text(show.name)
                        }
                    }
                }
            case let .error(errorMessage):
                Text(errorMessage)
                    .font(.headline)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(value: AddShowView.Arguments()) {
                    Label("Add show", systemImage: "plus")
                }
            }
        }
        .navigationTitle("Shows")
        .onAppear {
            viewModel.loadShows()
        }
    }
}

struct ShowsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView(
            viewModel: ShowsViewModel(
                showsRepository: ShowsRepository(
                    persistenceController: PersistenceController.preview,
                    showDAO: ShowDAO(),
                    showsMapper: ShowsMapper()
                )
            )
        )
    }
}
