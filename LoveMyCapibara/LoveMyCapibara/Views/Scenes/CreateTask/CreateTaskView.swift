//
//  CreateTaskView.swift
//  LoveMyCapibara
//
//  Created by Ravi on 28/06/23.
//

import SwiftUI

struct CreateTaskView: View {
    
    @ObservedObject var viewModel = CreateTaskViewModel()
    @State var hideTextFieldTitle: Bool = false
    var body: some View {
        VStack {
            Group {
                VStack {
                    InputText(placeholder: "Titulo", value: $viewModel.txtTitle)
                    
                    LineView.make()
                    
                    InputPicker(label: "Tipo de tarefa",
                                value: $viewModel.task.type,
                                options: TaskTypeModel.allCases)
                    
                    LineView.make()
                    
                    InputPicker(label: "Pet",
                                value: $viewModel.selectedPet,
                                options: viewModel.petNameList)
                }
                VStack {
                    DatePickerView(selectedDate: $viewModel.task.date, title: "Data")
                    LineView.make()
                    InputPicker(label: "Repetir",
                                value: $viewModel.task.frequency,
                                options: FrequencyModel.allCases)
                    LineView.make()
                    InputPicker(label: "Lembrete",
                                value: $viewModel.task.rememberAt,
                                options: RememberAtModel.allCases)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color("FieldBackgroundColor"))
            .font(FontManager.poppinsRegular(size: 16))
            .foregroundColor(Color("PrimaryText"))
            .cornerRadius(16)
            
            VStack(alignment: .leading) {
                TextField("Descrição", text: $viewModel.text, axis: .vertical)
                .padding(.top, 16)
                Spacer()
            }
            .frame(height: 200)
            .padding(.horizontal, 20)
            .background(Color("FieldBackgroundColor"))
            .cornerRadius(16)

        }
        .padding(.horizontal)
    }
}
