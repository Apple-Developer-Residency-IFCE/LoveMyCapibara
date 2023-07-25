//
//  EditTaskView.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 17/07/23.
//

import SwiftUI

struct EditTaskView: View {
    var taskInstance: TaskModel
    @State private var isPopUpActive: Bool = false
    @StateObject var viewModel: EditTaskViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    init(taskInstance: TaskModel) {
        self.taskInstance = taskInstance
        _viewModel = StateObject(wrappedValue: EditTaskViewModel(currentTask: taskInstance))
    }
    
    var body: some View {
        NavigationView {
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
                            
                            DatePickerView(selectedDate: $viewModel.date,
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
                    VStack(alignment: .leading) {
                        TextField("Descrição", text: $viewModel.text, axis: .vertical)
                            .padding(.top, 16)
                        Spacer()
                    }
                    .frame(height: 200)
                    .background(Color("FieldBackgroundColor"))
                    .cornerRadius(16)
                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color("FieldBackgroundColor"))
                .font(FontManager.poppinsRegular(size: 16))
                .foregroundColor(Color("PrimaryText"))
                .cornerRadius(16)
                
                CustomButton(buttonLabel: "Excluir tarefa", buttonAction: {
                    isPopUpActive = !isPopUpActive
                }, buttonColor: "DeleteButtonColor")
                .padding(.top)
                
                .alert(isPresented: $isPopUpActive) {
                    Alert(
                        title: Text("Deseja excluir o cadastro?"),
                        message: Text("Uma vez excluída, essa ação não pode ser desfeita"),
                        primaryButton: .cancel(Text("Cancelar"), action: {
                            isPopUpActive = false
                        }),
                        secondaryButton: .destructive(Text("Excluir"), action: {
                            viewModel.deleteById(taskInstance.id ?? UUID())
                            dismiss()
                        })
                    )
                }
            }
            .padding(.horizontal)
            .navBarEditTask {
                let updatedTask = viewModel.updateSelectedTask()
                viewModel.editTask(updatedTask)
                dismiss()
            }
        }
    }
}
struct EditTaskView_Previews: PreviewProvider {
    static private var taskTest = TaskModel(
        id: UUID(),
        title: "Tarefa teste",
        type: TaskTypeModel.leisure,
        pet: PetModel(),
        date: .now,
        frequency: FrequencyModel.monthly,
        text: "Levar no veterinario",
        completed: [String: Bool](),
        rememberAt: RememberAtModel.fiveMinutes
    )
    
    static var previews: some View {
        EditTaskView(taskInstance: taskTest)
    }
}
