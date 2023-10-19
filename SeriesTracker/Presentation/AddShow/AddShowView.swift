//
//  AddShowView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 18/10/2023.
//

import SwiftUI

struct AddShowView: View {
    @StateObject
    private var viewModel = AddShowViewModel()

    @State
    private var showName: String = ""

    @State
    private var hasSeveralSeasons: Bool = false

    @State
    private var currentSeason: String = ""

    @State
    private var currentEpisode: String = ""

    @State
    private var amountOfEpisodes: String = ""

    var body: some View {
        VStack {
            Form {
                TextField("Show name", text: $showName)

                Toggle("Has several seasons", isOn: $hasSeveralSeasons)
                    .padding(.top, 16)

                if hasSeveralSeasons {
                    TextField("Current season", text: $currentSeason)
                        .keyboardType(.asciiCapableNumberPad)
                }

                TextField("Current episode", text: $showName)
                    .keyboardType(.asciiCapableNumberPad)

                TextField("Amount of episodes", text: $amountOfEpisodes)
                    .keyboardType(.asciiCapableNumberPad)
            }

            Button("Add show", action: addShow)
                .buttonStyle(.borderedProminent)
        }
    }

    private func addShow() {
        let newShow = NewShow(
            name: showName,
            hasSeveralSeasons: hasSeveralSeasons,
            currentSeason: Int(currentSeason) ?? 1,
            currentEpisode: Int(currentEpisode) ?? 0,
            amountOfEpisodes: Int(amountOfEpisodes) ?? 0
        )

        viewModel.addShow(newShow)
    }
}

struct AddShowView_Previews: PreviewProvider {
    static var previews: some View {
        AddShowView()
    }
}
