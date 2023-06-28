//
//  TasksListView.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 28/06/23.
//

import SwiftUI

struct TasksListView: View {
    
    let columns = [GridItem()]
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("Tarefas pendentes")
                    .font(FontManager.poppinsBold(size: 20))
                    .foregroundColor(Color("PrimaryText"))
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    // Stub para quando a taskListViewModel for criada
                    //                ForEach (taskListModel.tasks, id: \.id){ task in
                    //                    NavigationLink{
                    //                        TaskDetailedView()
                    //                    }label: {
                    //                        TaskCardView()
                    //                    }
                    //                }
                    
                    TaskCardView(taskTitle: "Comprar comida", taskDescription: "comprar o pacote grande", petName: "Theobaldo", time: .now)
                    TaskCardView(taskTitle: "Vacinar o leozin", taskDescription: "levar no posto de vacinação", petName: "Leozin", time: .now)
                }
                HStack{
                    Image("IconFinished")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Tarefas concluídas")
                        .font(FontManager.poppinsBold(size: 20))
                        .foregroundColor(Color("PrimaryText"))
                }
                .padding(.top)
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    // Stub para quando a taskListViewModel for criada
                    //                ForEach (taskListModel.finishedTasks, id: \.id){ task in
                    //                    NavigationLink{
                    //                        TaskDetailedView()
                    //                    }label: {
                    //                        TaskCardView()
                    //                    }
                    //                }
                    
                    TaskCardView(taskTitle: "Comprar comida", taskDescription: "comprar o pacote grande", petName: "Theobaldo", time: .now)
                    TaskCardView(taskTitle: "Vacinar o leozin", taskDescription: "levar no posto de vacinação", petName: "Leozin", time: .now)
                    TaskCardView(taskTitle: "Comprar comida", taskDescription: "comprar o pacote grande", petName: "Theobaldo", time: .now)
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
