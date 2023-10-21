//
//  ShowsViewModel.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 19/10/2023.
//

import Combine

final class ShowsViewModel: ObservableObject {
    private let showsRepository: ShowsRepository

    @Published
    private(set) var uiState: ShowsUiState = .loading

    init(showsRepository: ShowsRepository) {
        self.showsRepository = showsRepository
    }

    func loadShows() {
        uiState = .loading

        do {
            let shows = try showsRepository.getShows()

            uiState = .success(shows)
        } catch {
            uiState = .error(error)
        }
    }
}
