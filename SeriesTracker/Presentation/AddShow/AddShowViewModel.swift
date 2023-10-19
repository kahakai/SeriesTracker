//
//  AddShowViewModel.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 19/10/2023.
//

import Combine

final class AddShowViewModel: ObservableObject {
    @Published
    private(set) var uiState: AddShowUiState = .initial

    func addShow(_ newShow: NewShow) {
        // Save the new show.
    }
}
