//
//  TasksListView.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 28/06/23.
//

import SwiftUI

struct TasksListView: View {
    
    @StateObject var tasksListViewModel = TasksListViewModel()
    let columns = [GridItem()]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Tarefas pendentes")
                    .font(FontManager.poppinsBold(size: 20))
                    .foregroundColor(Color("PrimaryText"))
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(tasksListViewModel.tasks, id: \.id) { task in
                        NavigationLink {
                            // TaskDetailedView()
                        } label: {
                            TaskCardView(
                                task: task,
                                time: tasksListViewModel.timeFormatter(task: task)
                            )
                        }
                    }
                }
                .padding(.top)
                if tasksListViewModel.tasks.isEmpty {
                    emptyToDoList
                } else {
                    if !tasksListViewModel.completedTasks.isEmpty {
                        emptyToDoCompletedList
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    var emptyToDoList: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("Task Card Placeholder")
                .padding()
            Group {
                Text("Você não possui nenhuma tarefa pendente :)")
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(Color("PrimaryText"))
                Text("Ao adicionar tarefas, elas aparecerão aqui")
                    .font(FontManager.poppinsRegular(size: 13))
                    .foregroundColor(Color("PrimaryText"))
            }
            .multilineTextAlignment(.center)
            CustomButton(buttonLabel: "Adicionar Tarefa", buttonAction: {
                print("Botao apertado")
            }, buttonColor: "PrimaryColor")
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
    }
    
    var emptyToDoCompletedList: some View {
        Group {
            HStack {
                Image("IconFinished")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("Tarefas concluídas")
                    .font(FontManager.poppinsBold(size: 20))
                    .foregroundColor(Color("PrimaryText"))
            }
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(tasksListViewModel.completedTasks, id: \.id) { task in
                    NavigationLink {
                        // TaskDetailedView()
                    }label: {
                        TaskCardView(
                            task: task,
                            time: tasksListViewModel.timeFormatter(task: task)
                        )
                    }
                }
            }
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TasksListViewModel()
        viewModel.tasks = [
            TaskModel(
                id: UUID(),
                title: "Levar no veterinario",
                type: TaskTypeModel.medicine,
                pet: PetModel(),
                date: .now,
                text: "no benfica",
                completed: false
            ),
            TaskModel(
                id: UUID(),
                title: "Levar pra passear",
                type: TaskTypeModel.leisure,
                pet: PetModel(),
                date: .now,
                text: "na praça",
                completed: false
            )
        ]
        viewModel.completedTasks = [
            TaskModel(
                id: UUID(),
                title: "Comprar Comida",
                type: TaskTypeModel.others,
                pet: PetModel(),
                date: .now,
                text: "no supermercado",
                completed: true
            )
        ]
        return VStack {
            TasksListView(tasksListViewModel: viewModel)
        }
    }
}
