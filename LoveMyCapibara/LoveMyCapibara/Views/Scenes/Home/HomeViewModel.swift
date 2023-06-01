//
//  HomeViewModel.swift
//  LoveMyCapibara
//
//  Created by userext on 30/05/23.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var pets : [PetModel]
    var noPets : Bool {
        pets.isEmpty
    }
    
    init(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        self.pets = [
            PetModel(imageName: "tortinhaImage", id: 1, name: "Tortinha" , gender:.female, specie: .cat, birthDate: formatter.date(from: "28/05/2002") ?? .now, weigth: 7.0, castraded: true),
            PetModel(imageName: "PetTestImage", id: 2, name: "Katio, o Grande" , gender:.male, specie: .dog, birthDate: formatter.date(from: "13/03/2000") ?? .now, weigth: 17.0, castraded: false)
        ]
    }
}


