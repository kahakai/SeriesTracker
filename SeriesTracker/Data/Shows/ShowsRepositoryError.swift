//
//  ShowsRepositoryError.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 31/10/2023.
//

import Foundation

enum ShowsRepositoryError: LocalizedError {
    case showNotFound

    var errorDescription: String {
        switch self {
        case .showNotFound:
            return "Show was not found"
        }
    }
}
