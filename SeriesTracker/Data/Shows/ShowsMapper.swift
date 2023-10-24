//
//  ShowsMapper.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 21/10/2023.
//

import Foundation

struct ShowsMapper {
    func map(_ show: Show) -> ShowEntity {
        let entity = ShowEntity()
        entity.id = UUID()
        entity.name = show.name
        entity.hasSeveralSeasons = show.hasSeveralSeasons
        entity.currentSeason = Int16(show.currentSeason)
        entity.currentEpisode = Int16(show.currentEpisode)
        entity.amountOfEpisodes = Int16(show.amountOfEpisodes)
        return entity
    }

    func map(_ showEntities: [ShowEntity]) -> [Show] {
        return showEntities.map { entity in
            Show(
                id: entity.id ?? UUID(),
                name: entity.name ?? "N/A",
                hasSeveralSeasons: entity.hasSeveralSeasons,
                currentSeason: Int(entity.currentSeason),
                currentEpisode: Int(entity.currentEpisode),
                amountOfEpisodes: Int(entity.amountOfEpisodes)
            )
        }
    }
}
