//
//  RenderLineView.swift
//  LoveMyCapibara
//
//  Created by Ravi on 03/07/23.
//

import SwiftUI

struct LineView {
    static func make() -> some View {
        Divider()
            .padding(EdgeInsets(top: 0, leading: -16, bottom: 0, trailing: -16))
            .offset(y: -2)
    }
}
