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
                        }label: {
                            TaskCardView(
                                taskTitle: task.title ?? "Sem titulo",
                                taskDescription: task.text ?? "Sem descrição",
                                petName: task.pet?.name ?? "Pet",
                                time: task.date ?? .now
                            )
                        }
                    }
                }
                HStack {
                    Image("IconFinished")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Tarefas concluídas")
                        .font(FontManager.poppinsBold(size: 20))
                        .foregroundColor(Color("PrimaryText"))
                }
                .padding(.top)
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(tasksListViewModel.completedTasks, id: \.id) { task in
                        NavigationLink {
                            // TaskDetailedView()
                        }label: {
                            TaskCardView(
                                taskTitle: task.title ?? "Sem titulo",
                                taskDescription: task.text ?? "Sem descrição",
                                petName: task.pet?.name ?? "Pet",
                                time: task.date ?? .now
                            )
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView()
    }
}
