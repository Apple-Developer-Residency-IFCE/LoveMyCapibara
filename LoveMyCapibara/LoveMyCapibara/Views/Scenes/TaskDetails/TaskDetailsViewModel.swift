//
//  TaskDetailsViewModel.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 28/06/23.
//

import Foundation

class TaskDetailsViewModel: ObservableObject {
    @Published var task: TaskModel
    
    init() {
        self.task = TaskModel(
            title: "Dar o remédio para vermes",
            type: .medicine,
            pet: PetModel(name: "Tortinha"),
            date: Date.now,
            frequency: .monthly,
            text: "Teste teste teste teste teeeeeste teeeeeste teste.")
    }
    
    var dateFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: task.date)
    }
    
    var timeFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: task.date)
    }
}
