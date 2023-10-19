//
//  ShowsViewModel.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 19/10/2023.
//

import Combine

final class ShowsViewModel: ObservableObject {
    @Published
    private(set) var uiState: ShowsUiState = .loading

    func loadShows() {
        uiState = .loading

        let shows = [
            Show(
                name: "Rick & Morty",
                hasSeveralSeasons: true,
                currentSeason: 1,
                currentEpisode: 1,
                amountOfEpisodes: 24
            ),
            Show(
                name: "Rick & Morty",
                hasSeveralSeasons: true,
                currentSeason: 1,
                currentEpisode: 1,
                amountOfEpisodes: 24
            ),
            Show(
                name: "Rick & Morty",
                hasSeveralSeasons: true,
                currentSeason: 1,
                currentEpisode: 1,
                amountOfEpisodes: 24
            ),
            Show(
                name: "Rick & Morty",
                hasSeveralSeasons: true,
                currentSeason: 1,
                currentEpisode: 1,
                amountOfEpisodes: 24
            ),
            Show(
                name: "Rick & Morty",
                hasSeveralSeasons: true,
                currentSeason: 1,
                currentEpisode: 1,
                amountOfEpisodes: 24
            ),
        ]

        uiState = .success(shows)
    }
}
