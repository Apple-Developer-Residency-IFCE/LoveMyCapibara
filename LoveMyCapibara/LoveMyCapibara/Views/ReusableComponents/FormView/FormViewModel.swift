//
//  FormViewModel.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 12/06/23.
//

import Foundation
import SwiftUI

class FormViewModel: RaceModel, ObservableObject {
    @Published var pet: PetModel
    @Published var dataImage: Data? = nil
    
    var speciesOptions: [String]
    var raceBySpecies: Dictionary<String, [String]>
    
    func getRaces() -> [String] {
        guard let races = raceBySpecies[pet.specie] else{
            return ["Não escolhida"]
        }
        
        var options = races.sorted()
        options.insert("SRD", at: 0)
        
        return options
    }
    
    init(_ pet: PetModel? = nil) {
        if let petValue = pet {
            self.pet = petValue
            
            if let uiImage = UIImage(named: petValue.imageName) {
                if let imageData = uiImage.jpegData(compressionQuality: 1.0) {
                    self.dataImage = imageData
                }
            }
        }else{
            self.pet = PetModel(imageName: "", id: 0, name: "", gender: GenderModel.none, specie: "", race: "", birthDate: Date.now, weigth: 0.0, castrated: false)
        }
        
        self.speciesOptions = load("specie.json")
        self.raceBySpecies = load("race.json")
        
    }
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else{
        fatalError("Não foi possível encontrar o arquivo \(fileName)")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Não foi possível carregar o arquivo \(fileName)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Não foi possível decodificar o arquivo \(fileName)")
    }
}

