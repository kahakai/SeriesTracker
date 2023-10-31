//
//  Dependencies.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 31/10/2023.
//

struct DependenciesContainer {
    private let persistenceController: PersistenceController

    private let showsRepository: ShowsRepository

    let showsViewModel: ShowsViewModel
    let addShowViewModel: AddShowViewModel
    let showDetailsViewModel: ShowDetailsViewModel
    let editShowDetailsViewModel: EditShowDetailsViewModel

    init() {
        persistenceController = PersistenceController.shared

        showsRepository = ShowsRepository(
            persistenceController: persistenceController,
            showDAO: ShowDAO(),
            showsMapper: ShowsMapper()
        )

        showsViewModel = ShowsViewModel(
            showsRepository: showsRepository
        )

        addShowViewModel = AddShowViewModel(
            showsRepository: showsRepository
        )

        showDetailsViewModel = ShowDetailsViewModel(
            showsRepository: showsRepository
        )

        editShowDetailsViewModel = EditShowDetailsViewModel(
            showsRepository: showsRepository
        )
    }
}
