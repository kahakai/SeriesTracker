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
                    showsMapper: ShowsMapper()
                )
            )
        )
    }
}
