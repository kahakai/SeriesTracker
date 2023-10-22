//
//  AddShowViewModel.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 19/10/2023.
//

import Combine

final class AddShowViewModel: ObservableObject {
    private let showsRepository: ShowsRepository

    @Published
    private(set) var uiState = AddShowUiState(
        isLoading: false,
        isSuccessfullyAdded: false,
        error: nil
    )

    init(showsRepository: ShowsRepository) {
        self.showsRepository = showsRepository
    }

    func addShow(_ newShow: Show) {
        uiState = AddShowUiState(
            isLoading: true,
            isSuccessfullyAdded: false,
            error: nil
        )

        do {
            try showsRepository.addShow(newShow)

            uiState = AddShowUiState(
                isLoading: false,
                isSuccessfullyAdded: true,
                error: nil
            )
        } catch {
            uiState = AddShowUiState(
                isLoading: false,
                isSuccessfullyAdded: false,
                error: error.localizedDescription
            )
        }
    }
}
