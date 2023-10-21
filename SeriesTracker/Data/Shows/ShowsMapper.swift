//
//  ShowsMapper.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 21/10/2023.
//

struct ShowsMapper {
    func map(_ showEntities: [ShowEntity]) -> [Show] {
        return showEntities.map { entity in
            Show(
                name: entity.name ?? "N/A",
                hasSeveralSeasons: entity.hasSeveralSeasons,
                currentSeason: Int(entity.currentSeason),
                currentEpisode: Int(entity.currentEpisode),
                amountOfEpisodes: Int(entity.amountOfEpisodes)
            )
        }
    }
}
