//
//  SwipeContent.swift
//  LoveMyCapibara
//
//  Created by Ravi on 18/07/23.
//

import SwiftUI

//struct SwipeContent<Content: View>: View {
//
//    var content: () -> Content
//
//    @State var hoffset: CGFloat = 0
//    @State var origin: CGFloat = 0
//
//    var itemHeight: CGFloat = 300
//
//    let screenWidth = UIScreen.main.bounds.width
//    var gestureWidth: CGFloat { screenWidth / 3 }
//    var swipeThreshold: CGFloat { screenWidth / 15 }
//
//    @State var rightPast = false
//
//    init(@ViewBuilder content: @escaping () -> Content) {
//        self.content = content
//    }
//
//    var body: some View {
//        GeometryReader { geo in
//            ZStack {
//                HStack(spacing: 0) {
//                    content()
//                        .frame(width: geo.size.width)
//                }
//    //            .offset(x: -origin + hoffset)
//                .gesture(drag)
//                .frame(maxHeight: itemHeight)
//                .contentShape(Rectangle())
//                .clipped()
//            }
//        }
//    }
    
//    var drag: some Gesture {
//
//    }
//}
