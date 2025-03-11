//
//  Todo_AppApp.swift
//  Todo App
//
//  Created by Elexoft on 07/03/2025.
//

import SwiftUI

@main
struct Todo_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(IconNames()) // With this the cntent view will be aware of every chnage of this file
        }
    }
}
