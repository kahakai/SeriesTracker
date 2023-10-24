//
//  ShowDAO.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 24/10/2023.
//

import CoreData

struct ShowDAO {
    func fetchAll() -> NSFetchRequest<ShowEntity> {
        return ShowEntity.fetchRequest()
    }

    func fetchOne(withID id: UUID) -> NSFetchRequest<ShowEntity> {
        let fetchRequest = ShowEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(
            format: "%K == %@",
            "id", id as NSUUID
        )
        fetchRequest.fetchLimit = 1
        return fetchRequest
    }
}
