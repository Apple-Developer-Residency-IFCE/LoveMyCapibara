//
//  EditPetView.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 12/06/23.
//

import SwiftUI

struct EditPetView: View {
    
    var petInstance: PetModel
    @StateObject var formViewModel: FormViewModel
    @Environment(\.dismiss) var dismiss
    init(petInstance: PetModel) {
        self.petInstance = petInstance
        _formViewModel = StateObject(wrappedValue: FormViewModel(petInstance))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                FormView()
                    .environmentObject(formViewModel)
                
                CustomButton(buttonLabel: "Excluir cadastro", buttonAction: {
//                  TO-DO: add coredata action to delete
                    dismiss()
                },buttonColor: "DeleteButtonColor")
                    .padding(.top)
                Spacer()
            }
            .padding(.top)
            .navBarEditPet(){
                
            }
        }
        .padding(.top)
    }
}

struct EditPetView_Previews: PreviewProvider {
    static private var petTest = PetModel(imageName: "PetTestImage", id: 1, name: "Spack", gender: .male, specie: "Gato", race: "Siamês", birthDate: Date.now, weight: 5.6, castrated: true)
    
    static var previews: some View {
        EditPetView(petInstance: petTest)
    }
}
