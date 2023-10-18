//
//  AddShowView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 18/10/2023.
//

import SwiftUI

struct AddShowView: View {
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
        VStack(spacing: 16) {
            TextField("Show name", text: $showName)
                .textFieldStyle(.colorRoundedBorder)

            Toggle("Has several seasons", isOn: $hasSeveralSeasons)
                .padding(.top, 16)

            if hasSeveralSeasons {
                TextField("Current season", text: $currentSeason)
                    .textFieldStyle(.colorRoundedBorder)
                    .keyboardType(.asciiCapableNumberPad)
            }

            TextField("Current episode", text: $showName)
                .textFieldStyle(.colorRoundedBorder)
                .keyboardType(.asciiCapableNumberPad)

            TextField("Amount of episodes", text: $amountOfEpisodes)
                .textFieldStyle(.colorRoundedBorder)
                .keyboardType(.asciiCapableNumberPad)

            Spacer(minLength: 10)

            Button("Add show", action: addShow)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    private func addShow() {
        // Save the new show.
    }
}

struct AddShowView_Previews: PreviewProvider {
    static var previews: some View {
        AddShowView()
    }
}
