//
//  ShowDetailsUiState.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 24/10/2023.
//

import Foundation

enum ShowDetailsUiState {
    case loading
    case success(Show)
    case error(String)
}

enum LoadShowError: LocalizedError {
    case notFound

    var errorDescription: String {
        switch self {
        case .notFound:
            return "Show was not found"
        }
    }
}
