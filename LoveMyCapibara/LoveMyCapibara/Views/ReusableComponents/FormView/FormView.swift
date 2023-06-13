//
//  FormView.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 07/06/23.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var viewModel: FormViewModel
    
    func renderLine() -> some View{
        Divider()
            .padding(EdgeInsets(top: 0, leading: -16, bottom: 0, trailing: -16))
            .offset(y: -2)
    }
    
    var body: some View {
        VStack{
            
            ImagePicker(currentImage: Binding<Data?>(
                get: { viewModel.dataImage },
                set: { viewModel.dataImage = $0 }
            ))
                .padding(.bottom, 36)
            
            Group{
                VStack{
                    InputText(placeholder: "Nome do pet", value: $viewModel.pet.name)
                    renderLine()
                    
                    InputPicker(label: "Gênero", value: $viewModel.pet.gender, options: GenderModel.allCases)
                    renderLine()
                    
                    InputPicker(label: "Espécie", value: $viewModel.pet.specie, options: viewModel.speciesOptions)
                    renderLine()
                    
                    InputPicker(label: "Raça", value: $viewModel.pet.race, options: viewModel.getRaces())
                    renderLine()
                    
                    // Esse componente está sendo produzido pelo Winni e deverá ser substituído
                    DatePicker("Nascimento", selection: $viewModel.pet.birthDate, displayedComponents: .date)
                    // ----------------------------------------------
                }
                
                VStack{
                    // Esse componente está sendo produzido pelo Winni e deverá ser substituído
                    HStack{
                        Text("Peso")
                        
                        Spacer()
                        
                        Button {
                            viewModel.pet.weight += 1.0
                        } label: {
                            Text("\(viewModel.pet.weight.formatted()) Kg")
                                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                .background(Color("PickerBackgroundColor"))
                                .cornerRadius(4)
                            
                        }
                        
                    }
                    // ----------------------------------------------
                    renderLine()
                    
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
