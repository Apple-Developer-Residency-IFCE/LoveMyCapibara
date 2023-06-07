//
//  ThemeSelector.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI


struct ThemeSelector: View {
    @AppStorage("preferredColorScheme") var selectedOption = 1
    
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            ThemeOption(imageName: "DefaultTheme", label: "Sistema", id: 1, selectedID: $selectedOption)
            ThemeOption(imageName: "LightModeTheme", label: "Light", id: 2, selectedID: $selectedOption)
            ThemeOption(imageName: "Dark mode", label: "Dark", id: 3, selectedID: $selectedOption)
        }
    }
}

struct ThemeSelector_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSelector()
    }
}
