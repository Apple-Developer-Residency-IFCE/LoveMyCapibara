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
    var id : UUID = UUID()
    var name : String = ""
    var gender : GenderModel = GenderModel.none
    var specie : String = ""
    var race : String = ""
    var birthDate : Date = Date.now
    var weight : Double = 0.0
    var castrated : Bool = false
}
