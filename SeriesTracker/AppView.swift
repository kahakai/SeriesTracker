//
//  AppView.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 20/10/2023.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        NavigationStack {
            ShowsView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    
                    ToolbarItem {
                        NavigationLink(value: AddShowView.Arguments()) {
                            Label("Add show", systemImage: "plus")
                        }
                    }
                }
                .navigationDestination(for: AddShowView.Arguments.self) { _ in
                    AddShowView()
                }
            
            Text("Select an item")
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
