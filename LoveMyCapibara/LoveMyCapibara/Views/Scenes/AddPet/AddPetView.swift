//
//  AddPetView.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct AddPetView: View {
    @StateObject var addPetViewModel = AddPetViewModel()
    
    var body: some View {
        VStack{
            Group{
                VStack{
                    InputText(placeholder: "Nome do pet", value: $addPetViewModel.pet.name)
                    Divider().padding(.horizontal, -16)
                    
                    InputPicker(label: "Gênero", value: $addPetViewModel.pet.gender, options: GenderModel.allCases)
                    Divider().padding(.horizontal, -16)
                    
                    InputPicker(label: "Espécie", value: $addPetViewModel.pet.specie, options: addPetViewModel.speciesOptions)
                    Divider().padding(.horizontal, -16)
                    
                    InputPicker(label: "Raça", value: $addPetViewModel.pet.race, options: addPetViewModel.raceOptions)
                    Divider().padding(.horizontal, -16)
                    
                    // Esse componente está sendo produzido pelo Winni e deverá ser substituído
                    DatePicker("Nascimento", selection: $addPetViewModel.pet.birthDate, displayedComponents: .date)
                    // ----------------------------------------------
                }
                
                VStack{
                    // Esse componente está sendo produzido pelo Winni e deverá ser substituído
                    HStack{
                        Text("Peso")
                        
                        Spacer()
                        
                        Button {
                            addPetViewModel.pet.weigth += 1.0
                        } label: {
                            Text("\(addPetViewModel.pet.weigth.formatted()) Kg")
                                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                .background(Color("PickerBackgroundColor"))
                                .cornerRadius(4)
                            
                        }
                        
                    }
                    // ----------------------------------------------
                    Divider().padding(.horizontal, -16)
                    
                    InputPicker(label: "Castrado(a)?", value: $addPetViewModel.pet.castrated, options: [false, true])
                    
                }
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .background(Color("FieldBackgroundColor"))
            .font(FontManager.poppinsRegular(size: 16))
            .foregroundColor(Color("PrimaryText"))
            .cornerRadius(16)
        }
        .padding(.horizontal)
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView()
    }
}
