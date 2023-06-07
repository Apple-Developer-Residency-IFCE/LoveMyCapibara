//
//  GenderModel.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import Foundation


enum GenderModel : String, Codable, CaseIterable {
    
    case none = "Nenhum"
    case male = "Macho"
    case female = "Fêmea"
    
    var description: String{
        switch self{
        case .male:
            return "Macho"
        case .female:
            return "Fêmea"
        case .none:
            return "Nenhum"
        }
    }
}
