//
//  AddPetViewModel.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import Foundation

class AddPetViewModel: ObservableObject{
    @Published var pet: PetModel
    var speciesOptions: [String]
    var raceBySpecies: Dictionary<String, [String]>
    
    var raceOptions: [String]{
        guard let races = raceBySpecies[pet.specie] else{
            return ["Não escolhida"]
        }
        
        var options = races.sorted()
        options.insert("SRD", at: 0)
        
        return options
    }
    
    init() {
        self.pet = PetModel(imageName: "", id: 0, name: "", gender: .none, specie: "", race: "", birthDate: Date.now, weigth: 0.0, castrated: false)
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
