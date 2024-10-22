//
//  EditPetView.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 12/06/23.
//

import SwiftUI

struct EditPetView: View {
    var petInstance: PetModel
    @State var isPopUpActive: Bool = false
    @StateObject var formViewModel: FormViewModel
    @StateObject var viewModel: EditPetViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    init(petInstance: PetModel) {
        self.petInstance = petInstance
        _formViewModel = StateObject(wrappedValue: FormViewModel(petInstance))
        _viewModel = StateObject(wrappedValue: EditPetViewModel(petManager: PetDataManager.shared, currentPet: petInstance))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                FormView()
                    .environmentObject(formViewModel)
                
                CustomButton(buttonLabel: "Excluir cadastro", buttonAction: {
                    isPopUpActive = !isPopUpActive
                }, buttonColor: "DeleteButtonColor")
                .alert(isPresented: $isPopUpActive) {
                    Alert(
                        title: Text("Deseja excluir o cadastro?"),
                        message: Text("Uma vez excluída, essa ação não pode ser desfeita."),
                        primaryButton: .cancel(Text("Cancelar"), action: {
                            isPopUpActive = false
                        }),
                        secondaryButton: .destructive(Text("Excluir"), action: {
                            viewModel.deleteById(petInstance.id)
                            dismiss()
                        })
                    )
                }
                .padding(.top)
                Spacer()
            }
            .padding(.top)
            .background(Color("BackgroundColor"))
            .navBarEditPet(isDisabled: !viewModel.petIsValid(pet: formViewModel.pet)) {
                viewModel.edit(formViewModel.pet)
                dismiss()
            }
        }
    }
}

struct EditPetView_Previews: PreviewProvider {
    static private var petTest = PetModel(
        imageName: Data(),
        id: UUID(),
        name: "Spack",
        gender: .male,
        specie: "Gato",
        race: "Siamês",
        birthDate: Date.now,
        weight: 5.6,
        castrated: true
    )
    
    static var previews: some View {
        EditPetView(petInstance: petTest)
    }
}
