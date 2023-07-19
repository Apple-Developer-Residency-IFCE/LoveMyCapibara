//
//  LoveMyCapibaraApp.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

@main
struct LoveMyCapibaraApp: App {
    @AppStorage("preferredColorScheme") var selectedOption = 1
    @AppStorage("onboarding") var isOnboarding: Bool = true
    
    // Instancia da classe controladora do core data
    let persistenceManager = CoreDataManager.shared
    
    var theme: ColorScheme? {
        if selectedOption == 1 {
            return nil
        } else if selectedOption == 2 {
            return .light
        } else {
            return .dark
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isOnboarding {
                    OnboardingView(nextView: { isOnboarding = false })
                } else {
                    ContentView()
                        .preferredColorScheme(theme)
                        .environment(\.managedObjectContext, persistenceManager.persistentContainer.viewContext)
                }
            }
        }
    }
}
