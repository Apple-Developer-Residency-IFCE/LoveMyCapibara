//
//  FormView.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 07/06/23.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var viewModel: FormViewModel
    
    var body: some View {
        VStack {
            
            ImagePicker(currentImage: $viewModel.pet.imageName)
                .padding(.bottom, 36)
            
            Group {
                VStack {
                    InputText(placeholder: "Nome do pet", value: $viewModel.pet.name)
                        .foregroundColor(Color("SecondaryText"))
                    LineView.make()
                    
                    InputPicker(label: "Gênero", value: $viewModel.pet.gender, options: GenderModel.allCases)
                    LineView.make()
                    
                    InputPicker(label: "Espécie", value: $viewModel.pet.specie, options: viewModel.speciesOptions)
                    LineView.make()
                    
                    InputPicker(label: "Raça", value: $viewModel.pet.race, options: viewModel.getRaces())
                    LineView.make()
                    
                    DatePickerView(selectedDate: $viewModel.pet.birthDate)
                }
                
                VStack {
                    ButtonWeightPicker(weight: $viewModel.pet.weight)
                    LineView.make()
    
                    InputPicker(label: "Castrado(a)?", value: $viewModel.pet.castrated, options: [false, true])
              
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color("FieldBackgroundColor"))
            .font(FontManager.poppinsRegular(size: 16))
            .foregroundColor(Color("PrimaryText"))
            .cornerRadius(16)
        }
        .padding(.horizontal)
    }
}

struct FormView_Previews: PreviewProvider {
    static private var viewModel = FormViewModel()
    
    static var previews: some View {
        FormView()
            .environmentObject(FormViewModel())
    }
}
