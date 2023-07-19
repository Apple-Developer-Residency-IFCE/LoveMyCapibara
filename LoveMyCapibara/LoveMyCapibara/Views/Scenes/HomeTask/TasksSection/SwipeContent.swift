//
//  SwipeContent.swift
//  LoveMyCapibara
//
//  Created by Ravi on 18/07/23.
//

import SwiftUI

struct SwipeContent<Content: View>: View {
    
    var content: () -> Content
    
    @State var hoffset: CGFloat = 0
    @State var origin: CGFloat = 0
    
    let screenWidth = UIScreen.main.bounds.width
    var gestureWidth: CGFloat { screenWidth / 3 }
    var swipeThreshold: CGFloat { screenWidth / 15 }
    
    @State var rightPast = false
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                Content()
                    .frame(width: geo.size.width)

            }
        }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation {
                    
                    hoffset = origin + value.translation.width
                    
                    if abs(hoffset) > gestureWidth {
                        hoffset = origin
                    }
                    if origin < 0 {
                        rightPast = hoffset < -gestureWidth
                    }
                }
            }
            .onEnded { value in
                withAnimation {
                    if rightPast {
                        origin = -gestureWidth
                    } else {
                        origin = 0
                    }
                    
                    hoffset = origin
                }
            }
    }
}
