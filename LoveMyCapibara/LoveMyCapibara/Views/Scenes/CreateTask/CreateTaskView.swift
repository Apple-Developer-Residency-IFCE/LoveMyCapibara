//
//  CreateTaskView.swift
//  LoveMyCapibara
//
//  Created by Ravi on 28/06/23.
//

import SwiftUI

struct CreateTaskView: View {
    
    @ObservedObject var viewModel = CreateTaskViewModel()
    @Environment(\.dismiss) private var dismiss: DismissAction
    @State var timer: Date = .now
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Group {
                        VStack {
                            InputText(placeholder: "Titulo", value: $viewModel.txtTitle)
                            
                            LineView.make()
                            
                            InputPicker(label: "Tipo de tarefa",
                                        value: $viewModel.type,
                                        options: TaskTypeModel.allCases)
                            
                            LineView.make()
                            
                            InputPicker(label: "Pet",
                                        value: $viewModel.selectedPet,
                                        options: viewModel.petNameList)
                        }
                        VStack {
                            HStack {
                                DatePickerView(selectedDate: $viewModel.date,
                                               toDate: .distantFuture,
                                               title: "Data")
                                
                                DatePickerView(selectedDate: $timer,
                                               toDate: .distantFuture,
                                               component: .hourAndMinute,
                                               title: "")
                                .labelsHidden()
                            }
                            LineView.make()
                            InputPicker(label: "Repetir",
                                        value: $viewModel.frequency,
                                        options: FrequencyModel.allCases)
                            LineView.make()
                            InputPicker(label: "Lembrete",
                                        value: $viewModel.rememberAt,
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
                    
                    .navBarAddTask(isDisabled: !viewModel.taskIsValid(task: viewModel.task)) {
                        viewModel.createTaskForPet()
                        dismiss()
                    }
                }
                .onAppear {
                    viewModel.getPets()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
    }
}
