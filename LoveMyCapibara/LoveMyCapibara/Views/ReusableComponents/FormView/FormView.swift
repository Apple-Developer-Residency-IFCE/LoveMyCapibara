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
                    InputText(placeholder: "Nome do pet", value: Binding<String>(
                        get: { viewModel.pet.name },
                        set: { viewModel.pet.name = $0 }
                    ))
                    renderLine()
                    
                    InputPicker(label: "Gênero", value: Binding<GenderModel>(
                        get: { viewModel.pet.gender },
                        set: { viewModel.pet.gender = $0 }
                    ), options: GenderModel.allCases)
                    renderLine()
                    
                    InputPicker(label: "Espécie", value: Binding<String>(
                        get: { viewModel.pet.specie },
                        set: {viewModel.pet.specie = $0 }
                    ), options: viewModel.speciesOptions)
                    renderLine()
                    
                    InputPicker(label: "Raça", value: Binding<String>(
                        get: { viewModel.pet.race },
                        set: { viewModel.pet.race = $0 }
                    ), options: viewModel.getRaces())
                    renderLine()
                    
                    // Esse componente está sendo produzido pelo Winni e deverá ser substituído
                    DatePicker("Nascimento", selection: Binding<Date>(
                        get: { viewModel.pet.birthDate },
                        set: { viewModel.pet.birthDate = $0 }
                    ), displayedComponents: .date)
                    // ----------------------------------------------
                }
                
                VStack{
                    // Esse componente está sendo produzido pelo Winni e deverá ser substituído
                    HStack{
                        Text("Peso")
                        
                        Spacer()
                        
                        Button {
                            viewModel.pet.weigth += 1.0
                        } label: {
                            Text("\(viewModel.pet.weigth.formatted()) Kg")
                                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                .background(Color("PickerBackgroundColor"))
                                .cornerRadius(4)
                            
                        }
                        
                    }
                    // ----------------------------------------------
                    renderLine()
                    
                    InputPicker(label: "Castrado(a)?", value: Binding<Bool>(
                        get: { viewModel.pet.castrated },
                        set: { viewModel.pet.castrated = $0 }
                    ), options: [false, true])
                    
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
