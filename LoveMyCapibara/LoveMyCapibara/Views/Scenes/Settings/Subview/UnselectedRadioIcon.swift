//
//  UnselectedRadioIcon.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct UnselectedRadioIcon: View {
    var body: some View {
        Circle()
            .frame(width: 20, height: 20)
            .overlay(
                Circle()
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color("PrimaryColor"))
            )
            .foregroundColor(.clear)
    }
}

struct UnselectedRadioIcon_Previews: PreviewProvider {
    static var previews: some View {
        UnselectedRadioIcon()
    }
}
