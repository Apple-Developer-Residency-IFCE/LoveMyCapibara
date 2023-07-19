//
//  OnboardingView.swift
//  LoveMyCapibara
//
//  Created by Ravi on 17/07/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var index: Int = 0
    private let allCases = CardForIndexOnboarding.allCases
    
    var nextView: () -> Void
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(0..<3, id: \.self) { index in
                    CardView(index: index)
                        .scaledToFit()
                        .id(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(alignment: .bottom, content: {
                overlayView
            })
        }.animation(.spring(), value: index)
    }
    
    private var overlayView: some View {
        VStack {
            HStack(alignment: .bottom) {
                ForEach(allCases.indices, id: \.self) { index in
                    Capsule()
                        .fill(self.index == index ? Color("PrimaryColor") : .gray)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.bottom, 18)
            HStack {
                Button(action: nextView, label: {
                    Text("Pular")
                        .fontWeight(.semibold)
                })
                .opacity(index == 2 ? 0 : 1)
                .foregroundColor(Color("PrimaryColor"))
                Spacer()
                Button {
                    index += 1
                    if index == 3 {
                        nextView()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("PrimaryColor"))
                        Text("Avançar")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.all, 8)
                    }
                }
                .frame(width: 120, height: 40)
            }
            .padding(.horizontal, 24)
        }
        .padding(.bottom, 70)
    }
}

private struct CardView: View {
    
    @State var index: Int
    private let allCases = CardForIndexOnboarding.allCases
    
    var body: some View {
        VStack {
            allCases[index].image
                .frame(width: UIScreen.main.bounds.width, height: 320)

            Text(allCases[index].title)
                .font(FontManager.poppinsBold(size: 28))
            Text(allCases[index].subTitle)
                .font(FontManager.poppinsRegular(size: 13))
                .multilineTextAlignment(.center)
        }
        .frame(height: UIScreen.main.bounds.height / 2)
        .padding(.horizontal, 20)
    }
}
