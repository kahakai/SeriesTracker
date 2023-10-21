//
//  ShowsRepository.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 21/10/2023.
//

import CoreData

struct ShowsRepository {
    let persistenceController: PersistenceController
    let showsMapper: ShowsMapper

    private var managedContext: NSManagedObjectContext {
        let container = persistenceController.container
        return container.viewContext
    }

    func getShows() throws -> [Show] {
        let fetchAllRequest = ShowEntity.fetchRequest()
        let entities = try managedContext.fetch(fetchAllRequest)
        return showsMapper.map(entities)
    }
}
