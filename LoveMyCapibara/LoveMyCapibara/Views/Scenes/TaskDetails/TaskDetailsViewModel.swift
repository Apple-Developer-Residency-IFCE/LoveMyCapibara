//
//  TaskDetailsViewModel.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 28/06/23.
//

import Foundation

class TaskDetailsViewModel: ObservableObject {
    @Published var task: TaskModel
    let taskManager = TaskDataManager.shared
    
    init(task: TaskModel) {
        self.task = task
    }
    
    var dateFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: task.date)
    }
    
    func updateTask() {
        if let taskId = task.id {
            task = taskManager.getTaskById(taskId) ?? TaskModel()
        }
    }
    
    var timeFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: task.date)
    }
    
    func completeTask() {
        self.task.completed = true
        taskManager.updateTask(self.task)
    }
    
    func uncompleteTask() {
        self.task.completed = false
        taskManager.updateTask(self.task)
    }
}
