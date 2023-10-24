//
//  ShowDetailsViewModel.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 24/10/2023.
//

import Foundation
import Combine

final class ShowDetailsViewModel: ObservableObject {
    private let showsRepository: ShowsRepository

    @Published
    private(set) var uiState: ShowDetailsUiState = .loading

    init(showsRepository: ShowsRepository) {
        self.showsRepository = showsRepository
    }

    func loadShow(withID id: UUID) {
        uiState = .loading

        do {
            guard let show = try showsRepository.getShow(withID: id) else {
                uiState = .error(LoadShowError.notFound.localizedDescription)
                return
            }

            uiState = .success(show)
        } catch {
            uiState = .error(error.localizedDescription)
        }
    }
}
