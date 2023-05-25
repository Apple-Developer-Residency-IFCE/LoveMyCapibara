//
//  RaceBySpieceModel.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import Foundation

struct RaceBySpiece: Codable{
    
    var dict: [SpicieModel : [String]] = [
        .dog: ["SRD"],
        .cat: ["SRD"],
        .bird: ["SRD"],
        .rabbit: ["SRD"],
        .hamster: ["SRD"],
        .turtle: ["SRD"],
        .horse: ["SRD"],
        
    ]
}
