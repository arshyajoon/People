//
//  People_swiftApp.swift
//  People.swift
//
//  Created by Arshya GHAVAMI on 2/28/21.
//

import SwiftUI

@main
struct People_swiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
