//
//  QueridoDiarioApp.swift
//  QueridoDiario
//
//  Created by Caio de Almeida Pessoa on 07/01/25.
//

import SwiftUI
import SwiftData

@main
struct QueridoDiarioApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            DiaryPage.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
        PageViewModel.shared.initialize(context: sharedModelContainer.mainContext)
        setupTabBarAppearance()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
    
    private func setupTabBarAppearance() {
        UITabBar.appearance().backgroundColor = UIColor(Color("neutrals_01"))
        UITabBar.appearance().layer.cornerRadius = 15
        UITabBar.appearance().layer.masksToBounds = true
    }
}
