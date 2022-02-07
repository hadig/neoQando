//
//  neoQandoApp.swift
//  neoQando
//
//  Created by Hadi G. on 26.10.21.
//

import SwiftUI

@main
struct neoQandoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabNavigation()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
