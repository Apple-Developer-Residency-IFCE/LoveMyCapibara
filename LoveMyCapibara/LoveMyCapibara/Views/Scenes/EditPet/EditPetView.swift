//
//  EditPetView.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 12/06/23.
//

import SwiftUI

struct EditPetView: View {
    @ObservedObject var formViewModel = FormViewModel(PetModel(imageName: "PetTestImage", id: 1, name: "Kaioni", gender: GenderModel.male, specie: "Cachorro", race: "Labrador Retriever", birthDate: Date.now, weigth: 23.7, castrated: true))
    
    var body: some View {
        FormView()
            .environmentObject(formViewModel)
    }
}

struct EditPetView_Previews: PreviewProvider {
    static var previews: some View {
        EditPetView()
    }
}
