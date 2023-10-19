//
//  Show.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 19/10/2023.
//

struct Show: Identifiable, Hashable {
    let name: String
    let hasSeveralSeasons: Bool
    let currentSeason: Int
    let currentEpisode: Int
    let amountOfEpisodes: Int

    var id: String {
        return name
    }
}
