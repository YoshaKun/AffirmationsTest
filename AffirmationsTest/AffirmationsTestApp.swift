//
//  AffirmationsTestApp.swift
//  AffirmationsTest
//
//  Created by Yosha Kun on 04.08.2024.
//

import SwiftUI

@main
struct AffirmationsTestApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                MainView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                OnboardingView()
            }
        }
    }
}
