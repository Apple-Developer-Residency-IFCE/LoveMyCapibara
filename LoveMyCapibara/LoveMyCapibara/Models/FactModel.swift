//
//  FactModel.swift
//  LoveMyCapibara
//
//  Created by Isaias Dimitri on 29/06/23.
//

import Foundation

struct Fact: Codable {
    var fact: String
    var length: Int
}

// Move this class to viewmodel !!!1
class CatFactApi: ObservableObject {
    @Published var fact: Fact = Fact(fact: "", length: 0)
    
    func newFact(maxLength: Int, completion: @escaping (Fact) -> Void) {
        guard let url = URL(string: "https://catfact.ninja/fact?max_length=\(maxLength)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else { return }
            print(String(data: data, encoding: .utf8)!)
            do {
                let fact = try JSONDecoder().decode(Fact.self, from: data)
                print(fact)
                DispatchQueue.main.async {
                    completion(fact)
                    print(fact)
                }
            } catch let error {
                print("[ERROR]", error)
            }
        }.resume()
    }
}
