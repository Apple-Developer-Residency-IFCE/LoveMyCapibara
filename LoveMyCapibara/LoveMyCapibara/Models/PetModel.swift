//
//  PetModel.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//
//
// Na viewModel -> var image: Image {Image(imageName)}


import Foundation
import SwiftUI

struct PetModel: Codable, Identifiable {
    
    var imageName: String
    
    var id : Int
    var name : String
    var gender : GenderModel
    var specie : String
    var race : String
    var birthDate : Date
    var weigth : Double
    var castrated : Bool
}
