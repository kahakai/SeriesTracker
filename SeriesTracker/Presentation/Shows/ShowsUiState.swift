//
//  ShowsUiState.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 19/10/2023.
//

enum ShowsUiState {
    case loading
    case success([Show])
    case error(Error)
}
