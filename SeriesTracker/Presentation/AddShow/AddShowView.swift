//
//  AddShowView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 18/10/2023.
//

import SwiftUI

struct AddShowView: View {
    @StateObject
    var viewModel: AddShowViewModel

    @Environment(\.dismiss)
    private var dismiss

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

    private var isAddShowButtonDisabled: Bool {
        return showName.count < 2
            || (hasSeveralSeasons && currentSeason.isEmpty)
            || currentEpisode.isEmpty
            || amountOfEpisodes.isEmpty
    }

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

                TextField("Current episode", text: $currentEpisode)
                    .keyboardType(.asciiCapableNumberPad)

                TextField("Amount of episodes", text: $amountOfEpisodes)
                    .keyboardType(.asciiCapableNumberPad)
            }

            if let error = viewModel.uiState.error {
                Text(error)
                    .font(.headline)
            }

            Button(
                action: addShow,
                label: {
                    if viewModel.uiState.isLoading {
                        ProgressView()
                    } else {
                        Text("Add show")
                    }
                }
            )
            .buttonStyle(.borderedProminent)
            .disabled(isAddShowButtonDisabled)
        }
        .navigationTitle("Add show")
        .disabled(viewModel.uiState.isLoading)
        .onChange(of: viewModel.uiState.isSuccessfullyAdded) { shouldDismiss in
            if shouldDismiss {
                dismiss()
            }
        }
    }

    private func addShow() {
        let newShow = Show(
            id: UUID(),
            name: showName,
            hasSeveralSeasons: hasSeveralSeasons,
            currentSeason: Int(currentSeason) ?? 1,
            currentEpisode: Int(currentEpisode) ?? 0,
            amountOfEpisodes: Int(amountOfEpisodes) ?? 1
        )

        viewModel.addShow(newShow)
    }
}

extension AddShowView {
    struct Arguments: Hashable {
    }
}

struct AddShowView_Previews: PreviewProvider {
    static var previews: some View {
        AddShowView(
            viewModel: AddShowViewModel(
                showsRepository: ShowsRepository(
                    persistenceController: PersistenceController.preview,
                    showsMapper: ShowsMapper()
                )
            )
        )
    }
}
