//
//  PetModel.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//
//

import Foundation
import SwiftUI

struct PetModel: Codable, Identifiable, Equatable {
    
    var imageName: Data? = Data()
    var id: UUID = UUID()
    var name: String = ""
    var gender: GenderModel = GenderModel.none
    var specie: String = ""
    var race: String = ""
    var birthDate: Date = Date.now
    var weight: Double = 0.0
    var castrated: Bool = false
    
    static func == (lhs: PetModel, rhs: PetModel) -> Bool {
        return lhs.imageName == rhs.imageName &&
        lhs.name == rhs.name &&
        lhs.gender == rhs.gender &&
        lhs.specie == rhs.specie &&
        lhs.race == rhs.race &&
        lhs.birthDate == rhs.birthDate &&
        lhs.weight == rhs.weight &&
        lhs.castrated == rhs.castrated
    }
    
    static func != (lhs: PetModel, rhs: PetModel) -> Bool {
        return !(lhs == rhs)
    }
}
