//
//  ShowsRepository.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 21/10/2023.
//

import CoreData

struct ShowsRepository {
    let persistenceController: PersistenceController
    let showDAO: ShowDAO
    let showsMapper: ShowsMapper

    private var managedContext: NSManagedObjectContext {
        let container = persistenceController.container
        return container.viewContext
    }

    func addShow(_ show: Show) throws {
        let entity = showsMapper.map(show)

        managedContext.insert(entity)
        try managedContext.save()
    }

    func getShows() throws -> [Show] {
        let fetchRequest = showDAO.fetchAll()
        let entities = try managedContext.fetch(fetchRequest)
        return showsMapper.map(entities)
    }

    func getShow(withID id: UUID) throws -> Show? {
        let fetchRequest = showDAO.fetchOne(withID: id)
        let entities = try managedContext.fetch(fetchRequest)

        guard let entity = entities.first else {
            return nil
        }

        return showsMapper.map(entity)
    }
}
