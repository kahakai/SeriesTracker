//
//  ShowsView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 19/10/2023.
//

import SwiftUI

struct ShowsView: View {
    @StateObject
    private var viewModel = ShowsViewModel()

    var body: some View {
        VStack {
            switch viewModel.uiState {
            case .loading:
                ProgressView()
                    .controlSize(.large)
            case let .success(shows):
                List {
                    ForEach(shows) { show in
                        NavigationLink(value: show) {
                            Text(show.name)
                        }
                    }
                }
            case let .error(error):
                Text(error.localizedDescription)
                    .font(.headline)
            }
        }
        .navigationTitle("Shows")
        .onAppear {
            viewModel.loadShows()
        }
    }
}

struct ShowsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView()
    }
}
