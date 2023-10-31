//
//  EditShowDetailsViewModel.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 31/10/2023.
//

import Foundation
import Combine

final class EditShowDetailsViewModel: ObservableObject {
    private let showsRepository: ShowsRepository

    @Published
    private(set) var uiState = EditShowDetailsUiState(
        isShowLoading: false,
        show: nil,
        loadingError: nil,
        isSaveShowLoading: false,
        isSuccessfullySaved: false,
        savingError: nil
    )

    init(showsRepository: ShowsRepository) {
        self.showsRepository = showsRepository
    }

    func loadShow(withID id: Show.ID) {
        uiState = EditShowDetailsUiState(
            isShowLoading: true,
            show: nil,
            loadingError: nil,
            isSaveShowLoading: false,
            isSuccessfullySaved: false,
            savingError: nil
        )

        do {
            guard let show = try showsRepository.getShow(withID: id) else {
                uiState = EditShowDetailsUiState(
                    isShowLoading: false,
                    show: nil,
                    loadingError: EditShowDetailsError.notFound.localizedDescription,
                    isSaveShowLoading: false,
                    isSuccessfullySaved: false,
                    savingError: nil
                )
                return
            }

            uiState = EditShowDetailsUiState(
                isShowLoading: false,
                show: show,
                loadingError: nil,
                isSaveShowLoading: false,
                isSuccessfullySaved: false,
                savingError: nil
            )
        } catch {
            uiState = EditShowDetailsUiState(
                isShowLoading: false,
                show: nil,
                loadingError: error.localizedDescription,
                isSaveShowLoading: false,
                isSuccessfullySaved: false,
                savingError: nil
            )
        }
    }

    func saveShow(_ showWithUpdates: Show) {
        uiState = EditShowDetailsUiState(
            isShowLoading: false,
            show: showWithUpdates,
            loadingError: nil,
            isSaveShowLoading: true,
            isSuccessfullySaved: false,
            savingError: nil
        )

        do {
            try showsRepository.updateShow(showWithUpdates)

            uiState = EditShowDetailsUiState(
                isShowLoading: false,
                show: showWithUpdates,
                loadingError: nil,
                isSaveShowLoading: false,
                isSuccessfullySaved: true,
                savingError: nil
            )
        } catch {
            uiState = EditShowDetailsUiState(
                isShowLoading: false,
                show: showWithUpdates,
                loadingError: nil,
                isSaveShowLoading: false,
                isSuccessfullySaved: false,
                savingError: error.localizedDescription
            )
        }
    }

    func deleteShow(withID id: Show.ID) {
        uiState = EditShowDetailsUiState(
            isShowLoading: false,
            show: uiState.show,
            loadingError: nil,
            isSaveShowLoading: true,
            isSuccessfullySaved: false,
            savingError: nil
        )

        do {
            try showsRepository.deleteShow(withID: id)

            uiState = EditShowDetailsUiState(
                isShowLoading: false,
                show: uiState.show,
                loadingError: nil,
                isSaveShowLoading: false,
                isSuccessfullySaved: true,
                savingError: nil
            )
        } catch {
            uiState = EditShowDetailsUiState(
                isShowLoading: false,
                show: uiState.show,
                loadingError: nil,
                isSaveShowLoading: false,
                isSuccessfullySaved: false,
                savingError: error.localizedDescription
            )
        }
    }
}
