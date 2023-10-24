//
//  ShowDetailsView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 22/10/2023.
//

import SwiftUI

struct ShowDetailsView: View {
    let show: Show

    var body: some View {
        Form {
            if show.hasSeveralSeasons {
                HStack {
                    Text("Current season")
                    Spacer()
                    Text("\(show.currentSeason)")
                }
            }

            HStack {
                Text("Current episode")
                Spacer()
                Text("\(show.currentEpisode)")
            }

            HStack {
                Text("Amount of episodes")
                Spacer()
                Text("\(show.amountOfEpisodes)")
            }
        }
        .navigationTitle(show.name)
    }
}

extension ShowDetailsView {
    struct Arguments: Hashable {
        let show: Show
    }
}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailsView(
            show: Show(
                name: "Adventure Time",
                hasSeveralSeasons: true,
                currentSeason: 1,
                currentEpisode: 1,
                amountOfEpisodes: 16
            )
        )
    }
}
