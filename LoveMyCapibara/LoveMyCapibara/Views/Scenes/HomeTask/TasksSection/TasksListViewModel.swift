//
//  TaskListViewModel.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 29/06/23.
//

import Foundation

class TasksListViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    @Published var selectedDate: Date = Calendar.current.startOfDay(for: Date.now)
    
    let taskManager = TaskDataManager()
   
    var completedTasks: [TaskModel] {
        return tasks.filter({ $0.completed?[selectedDate.description] ?? false })
    }

    var unfinishedTasks: [TaskModel] {
        return tasks.filter({ !($0.completed?[selectedDate.description] ?? false)})
    }
    
    var showToDoTasks: Bool {
        if unfinishedTasks.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var showCompletedTasks: Bool {
        if completedTasks.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func updateList() {
        self.tasks = filterTasksByDate(taskManager.getAllTasks(), searchDate: selectedDate)
    }
    
    private func filterTasksByDate(_ tasks: [TaskModel], searchDate: Date) -> [TaskModel] {
        var filteredTask: [TaskModel] = []
        
        tasks.forEach { task in
            switch task.frequency {
            case .daily:
                filteredTask.append(task)
            case .weekly:
                let diff = Calendar.current.dateComponents([.day], from: Calendar.current.startOfDay(for: task.date), to: searchDate)
                
                if let days = diff.day, days >= 0 && days % 7 == 0 {
                    filteredTask.append(task)
                }
            case .twoWeeks:
                let diff = Calendar.current.dateComponents([.day], from: Calendar.current.startOfDay(for: task.date), to: searchDate)
                
                if let days = diff.day, days >= 0 && days % 14 == 0 {
                    filteredTask.append(task)
                }
            case .monthly:
                let diff = Calendar.current.dateComponents([.month, .day], from: Calendar.current.startOfDay(for: task.date), to: searchDate)
                
                if let months = diff.month, months >= 0 {
                    if let days = diff.day, days == 0 {
                        filteredTask.append(task)
                    }
                }
            case .annually:
                let diff = Calendar.current.dateComponents([.month, .day, .year], from: Calendar.current.startOfDay(for: task.date), to: searchDate)
                
                if let years = diff.year, years >= 0 {
                    if let months = diff.month, months >= 0 && months % 12 == 0 {
                        if let days = diff.day, days == 0 {
                            filteredTask.append(task)
                        }
                    }
                }
            default:
                let diff = Calendar.current.dateComponents([.day], from: Calendar.current.startOfDay(for: task.date), to: searchDate)
                
                if let days = diff.day, days == 0 {
                    filteredTask.append(task)
                }
            }
        }
        
        return filteredTask
    }
    
    func getDatesWithTaskInMonth(searchDate: Date) -> [Date] {
        let tasks = taskManager.getAllTasks()
        var datesWithTask: [Date] = []
        
        if let firstDayOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: searchDate)) {
            var date = firstDayOfMonth
            
            while Calendar.current.isDate(date, equalTo: firstDayOfMonth, toGranularity: .month) {
                guard let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else {
                    continue
                }
                let taskFilter = filterTasksByDate(tasks, searchDate: date)
                
                if !taskFilter.isEmpty {
                    datesWithTask.append(date)
                }
                
                date = nextDate
            }
        }
        
        return datesWithTask
    }

    func timeFormatter(task: TaskModel) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: task.date)
    }
    
    func deleteTask(id: UUID?) {
        guard let id else { return }
        taskManager.deleteTaskById(id)
        updateList()
    }
}
