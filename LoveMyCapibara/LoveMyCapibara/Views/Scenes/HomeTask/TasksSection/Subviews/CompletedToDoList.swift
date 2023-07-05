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
                        TaskDetailsView(task: task) {
                            tasksListViewModel.updateList()
                        }
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
