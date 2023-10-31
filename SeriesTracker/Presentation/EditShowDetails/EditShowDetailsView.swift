//
//  EditShowDetailsView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 25/10/2023.
//

import SwiftUI

struct EditShowDetailsView: View {
    let showID: Show.ID

    @StateObject
    var viewModel: EditShowDetailsViewModel

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

    private var isSaveShowButtonDisabled: Bool {
        return showName.count < 2
            || (hasSeveralSeasons && currentSeason.isEmpty)
            || currentEpisode.isEmpty
            || amountOfEpisodes.isEmpty
    }

    var body: some View {
        VStack {
            if viewModel.uiState.isShowLoading {
                ProgressView()
                    .controlSize(.large)
            } else if let errorMessage = viewModel.uiState.loadingError {
                Text(errorMessage)
                    .font(.headline)
            } else {
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
            }

            if let errorMessage = viewModel.uiState.savingError {
                Text(errorMessage)
                    .font(.headline)
            }

            Button(
                action: saveShow,
                label: {
                    if viewModel.uiState.isSaveShowLoading {
                        ProgressView()
                    } else {
                        Text("Save show")
                    }
                }
            )
            .buttonStyle(.borderedProminent)
            .disabled(isSaveShowButtonDisabled)
        }
        .navigationTitle(getNavigationTitle())
        .disabled(viewModel.uiState.isSaveShowLoading)
        .onAppear {
            viewModel.loadShow(withID: showID)
        }
        .onChange(of: viewModel.uiState.show) { show in
            guard let show else {
                return
            }

            setupForm(with: show)
        }
        .onChange(of: viewModel.uiState.isSuccessfullySaved) { shouldDismiss in
            if shouldDismiss {
                dismiss()
            }
        }
    }

    private func getNavigationTitle() -> String {
        if viewModel.uiState.isShowLoading {
            return "Loading..."
        }

        if let show = viewModel.uiState.show {
            return show.name
        }

        if viewModel.uiState.loadingError != nil {
            return "Error"
        }

        return ""
    }

    private func setupForm(with show: Show) {
        showName = show.name
        hasSeveralSeasons = show.hasSeveralSeasons
        currentSeason = String(show.currentSeason)
        currentEpisode = String(show.currentEpisode)
        amountOfEpisodes = String(show.amountOfEpisodes)
    }

    private func saveShow() {
        let showWithUpdates = Show(
            id: showID,
            name: showName,
            hasSeveralSeasons: hasSeveralSeasons,
            currentSeason: Int(currentSeason) ?? 1,
            currentEpisode: Int(currentEpisode) ?? 0,
            amountOfEpisodes: Int(amountOfEpisodes) ?? 1
        )

        viewModel.saveShow(showWithUpdates)
    }
}

extension EditShowDetailsView {
    struct Arguments: Hashable {
        let showID: Show.ID
    }
}

struct EditShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EditShowDetailsView(
            showID: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!,
            viewModel: EditShowDetailsViewModel(
                showsRepository: ShowsRepository(
                    persistenceController: PersistenceController.preview,
                    showDAO: ShowDAO(),
                    showsMapper: ShowsMapper()
                )
            )
        )
    }
}
