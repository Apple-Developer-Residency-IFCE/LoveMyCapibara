//
//  FontManager.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import Foundation
import SwiftUI

struct FontManager {
    static func poppinsBold(size: CGFloat) -> Font {
        return Font.custom("Poppins-Bold", size: size)
    }
    
    static func poppinsMedium(size: CGFloat) -> Font {
        return Font.custom("Poppins-Regular", size: size)
    }
    
    static func poppinsRegular(size: CGFloat) -> Font {
        return Font.custom("Poppins-Regular", size: size)
    }
    
    static func poppinsSemiBold(size: CGFloat) -> Font {
        return Font.custom("Poppins-Regular", size: size)
    }
}
