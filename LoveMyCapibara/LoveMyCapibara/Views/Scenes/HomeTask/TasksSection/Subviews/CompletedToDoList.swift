//
//  CompletedToDoList.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 03/07/23.
//

import SwiftUI

struct CompletedToDoList: View {
    
    var tasksListViewModel: TasksListViewModel
    let columns = [GridItem()]
    
    var body: some View {
        VStack(alignment: .leading) {
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

struct CompletedToDoList_Previews: PreviewProvider {

    static var previews: some View {
        
        let viewModel = TasksListViewModel()
        viewModel.completedTasks = [ TaskModel(
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
        
        return CompletedToDoList(tasksListViewModel: viewModel)
    }
}
