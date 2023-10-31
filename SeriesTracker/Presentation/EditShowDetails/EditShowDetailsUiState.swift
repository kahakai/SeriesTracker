//
//  EditShowDetailsUiState.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 31/10/2023.
//

import Foundation

struct EditShowDetailsUiState {
    let isShowLoading: Bool
    let show: Show?
    let loadingError: String?
    let isSaveShowLoading: Bool
    let isSuccessfullySaved: Bool
    let savingError: String?
}

enum EditShowDetailsError: LocalizedError {
    case notFound

    var errorDescription: String {
        switch self {
        case .notFound:
            return "Show was not found"
        }
    }
}
