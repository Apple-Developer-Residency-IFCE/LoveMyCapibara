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
    var spicie : SpicieModel
    var race : RaceBySpiece
    var birthDate : Date
    var weigth : Double
    var castraded : Bool
    
}
