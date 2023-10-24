//
//  Show.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 19/10/2023.
//

import Foundation

struct Show: Identifiable, Hashable {
    let id: UUID
    let name: String
    let hasSeveralSeasons: Bool
    let currentSeason: Int
    let currentEpisode: Int
    let amountOfEpisodes: Int
}
