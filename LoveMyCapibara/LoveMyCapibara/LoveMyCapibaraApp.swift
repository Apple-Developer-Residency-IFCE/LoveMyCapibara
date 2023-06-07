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
    @Environment(\.colorScheme) var colorScheme
    
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
            ContentView()
                .preferredColorScheme(theme)
                .onChange(of: colorScheme) { newValue in
                    print("changed")
                }
        }
    }
}


