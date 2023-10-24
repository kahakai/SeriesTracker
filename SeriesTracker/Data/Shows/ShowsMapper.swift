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

    func map(_ showEntity: ShowEntity) -> Show {
        return Show(
            id: showEntity.id ?? UUID(),
            name: showEntity.name ?? "N/A",
            hasSeveralSeasons: showEntity.hasSeveralSeasons,
            currentSeason: Int(showEntity.currentSeason),
            currentEpisode: Int(showEntity.currentEpisode),
            amountOfEpisodes: Int(showEntity.amountOfEpisodes)
        )
    }

    func map(_ showEntities: [ShowEntity]) -> [Show] {
        return showEntities.map(map(_:))
    }
}
