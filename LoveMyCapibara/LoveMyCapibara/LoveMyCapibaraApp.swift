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
    @State private var splashScreenIsActive: Bool = true
    
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
            if splashScreenIsActive {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                            withAnimation(.easeOut(duration: 1.3)) {
                                self.splashScreenIsActive = false
                            }
                        }
                    }
            } else {
                ContentView()
                    .preferredColorScheme(theme)
                    .environment(\.managedObjectContext, persistenceManager.persistentContainer.viewContext)
                }
        }
    }
}
