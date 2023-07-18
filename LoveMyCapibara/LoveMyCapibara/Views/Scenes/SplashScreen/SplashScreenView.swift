//
//  SplashScreenView.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 18/07/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color("SplashScreenColor")
                .ignoresSafeArea()
            
            Image("SplashScreenIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
