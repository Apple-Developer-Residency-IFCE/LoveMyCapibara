//
//  PetModel.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//
//

import Foundation
import SwiftUI

struct PetModel: Codable, Identifiable {
    
    var imageName: Data? = Data()
    var id: UUID = UUID()
    var name: String = ""
    var gender: GenderModel = GenderModel.none
    var specie: String = ""
    var race: String = ""
    var birthDate: Date = Date.now
    var weight: Double = 0.0
    var castrated: Bool = false
    
    init(imageName: Data? = Data(), id: UUID = UUID(), name: String = "", gender: GenderModel = GenderModel.none, specie: String = "", race: String = "", birthDate: Date = Date.now, weight: Double = 0.0, castrated: Bool = false) {
        self.imageName = imageName
        self.id = id
        self.name = name
        self.gender = gender
        self.specie = specie
        self.race = race
        self.birthDate = birthDate
        self.weight = weight
        self.castrated = castrated
    }
    
    init(petEntity: Pet?) {
        self.imageName = petEntity?.image ?? Data()
        self.id = petEntity?.id ?? .init()
        self.name = petEntity?.name ?? ""
        self.gender = GenderModel(rawValue: petEntity?.gender ?? "") ?? .none
        self.specie = petEntity?.specie ?? ""
        self.race = petEntity?.race ?? ""
        self.birthDate = petEntity?.birthdate ?? .now
        self.weight = petEntity?.weight ?? 0
        self.castrated = petEntity?.castrated ?? false
    }
}

extension PetModel: Equatable {
    
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
