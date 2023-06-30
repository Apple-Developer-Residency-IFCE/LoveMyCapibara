//
//  TaskListViewModel.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 29/06/23.
//

import Foundation

class TasksListViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    @Published var completedTasks: [TaskModel] = []
    
    let taskManager = TaskDataManager()

    func updateList() {
        // self.tasks = taskManager.getAllTasks
    }
    
    func completeTask() {
        // self.completedTasks = taskManager.getAllCompleteTasks
    }
    
    func timeFormatter(task: TaskModel) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: task.date ?? .now)
    }
}
