//
//  Disneyland_ExplorerApp.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 9/21/24.
//

import SwiftUI
import SwiftData

@main
struct Disneyland_ExplorerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
