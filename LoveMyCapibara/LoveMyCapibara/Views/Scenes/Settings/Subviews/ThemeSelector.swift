//
//  ThemeSelector.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI


struct ThemeSelector: View {
    @SceneStorage("preferredColorScheme") var selectedOption = 1
    @Environment(\.colorScheme) var colorScheme
    
    var theme: ColorScheme {
        if selectedOption == 1 {
            return colorScheme
        } else if selectedOption == 2 {
            return .light
        } else {
            return .dark
        }
    }
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            ThemeOption(imageName: "DefaultTheme", label: "Sistema", id: 1, selectedID: $selectedOption)
            ThemeOption(imageName: "LightModeTheme", label: "Light", id: 2, selectedID: $selectedOption)
            ThemeOption(imageName: "Dark mode", label: "Dark", id: 3, selectedID: $selectedOption)
        }.preferredColorScheme(theme)
    }
}

struct ThemeSelector_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSelector()
    }
}
