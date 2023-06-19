//
//  AddPetView.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct AddPetView: View {
    @ObservedObject var formViewModel = FormViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    private func saveToCoreData(){
        let newPet = Pet(context: viewContext)
        newPet.image = formViewModel.pet.imageName
        newPet.name = formViewModel.pet.name
        newPet.gender = formViewModel.pet.gender.description
        newPet.specie = formViewModel.pet.specie
        newPet.race = formViewModel.pet.race
        newPet.birthdate = formViewModel.pet.birthDate
        newPet.weight = formViewModel.pet.weight
        newPet.castrated = formViewModel.pet.castrated
        newPet.id = UUID()
        
        do{
            try viewContext.save()
            dismiss()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        VStack{
            FormView()
                .environmentObject(formViewModel)
            Button(action: {
                saveToCoreData()
                
            }, label: {
                Text("Aperte aqui para salvar")
            })
            Spacer()
        }
        .padding(.top)
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView()
    }
}
