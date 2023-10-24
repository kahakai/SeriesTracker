//
//  ShowDetailsView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 22/10/2023.
//

import SwiftUI

struct ShowDetailsView: View {
    let showID: Show.ID

    @StateObject
    var viewModel: ShowDetailsViewModel

    var body: some View {
        VStack {
            switch viewModel.uiState {
            case .loading:
                ProgressView()
                    .controlSize(.large)
            case let .success(show):
                Form {
                    if show.hasSeveralSeasons {
                        HStack {
                            Text("Current season")
                            Spacer()
                            Text("\(show.currentSeason)")
                        }
                    }

                    HStack {
                        Text("Current episode")
                        Spacer()
                        Text("\(show.currentEpisode)")
                    }

                    HStack {
                        Text("Amount of episodes")
                        Spacer()
                        Text("\(show.amountOfEpisodes)")
                    }
                }
            case let .error(errorMessage):
                Text(errorMessage)
                    .font(.headline)
            }
        }
        .navigationTitle(getNavigationTitle())
        .onAppear {
            viewModel.loadShow(withID: showID)
        }
    }

    private func getNavigationTitle() -> String {
        switch viewModel.uiState {
        case .loading:
            return "Loading..."
        case let .success(show):
            return show.name
        case .error(_):
            return "Error"
        }
    }
}

extension ShowDetailsView {
    struct Arguments: Hashable {
        let showID: Show.ID
    }
}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailsView(
            showID: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!,
            viewModel: ShowDetailsViewModel(
                showsRepository: ShowsRepository(
                    persistenceController: PersistenceController.preview,
                    showDAO: ShowDAO(),
                    showsMapper: ShowsMapper()
                )
            )
        )
    }
}
