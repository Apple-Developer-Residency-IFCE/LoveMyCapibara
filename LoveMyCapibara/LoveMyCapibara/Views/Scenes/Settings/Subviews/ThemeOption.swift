//
//  ThemeOption.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct ThemeOption: View {
    var imageName: String
    var label: String
    var id: Int
    @Binding var selectedID: Int
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 65, height: 160)
            Text(label)
                .font(FontManager.poppinsRegular(size: 13))
                .foregroundColor(Color("PrimaryText"))
            if selectedID == id {
                SelectedRadioIcon()
            } else {
                UnselectedRadioIcon()
            }
        }.onTapGesture {
            selectedID = id
        }
    }
}

struct ThemeOption_Previews: PreviewProvider {
    @State static var selectedID = 1
    
    static var previews: some View {
        ThemeOption(imageName: "Dark mode", label: "Dark", id: 3, selectedID: $selectedID)
    }
}
