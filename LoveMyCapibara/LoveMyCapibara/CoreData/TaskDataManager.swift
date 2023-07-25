//
//  TaskDataManager.swift
//  LoveMyCapibara
//
//  Created by Ravi on 29/06/23.
//

import Foundation
import CoreData

class TaskDataManager {
    var context: NSManagedObjectContext
    
    init() {
        self.context = CoreDataManager.shared.viewContext
    }
    
    func getAllTasks() -> [TaskModel] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            return result.map { task in
                    .init(taskCoreData: task)
            }
        } catch {
            return []
        }
    }
    
    func getAllTasksInMonth(searchDate: Date) -> [TaskModel] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        let calendar = Calendar.current
        let componentsDate = calendar.dateComponents([.month, .year], from: searchDate)
        
        if let firstDayMonth = calendar.date(from: componentsDate),
           let lastDayMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: firstDayMonth) {
            request.predicate = NSPredicate(format: "(date >= %@) AND (date <= %@)", firstDayMonth as NSDate, lastDayMonth as NSDate)
        }
        
        do {
            let result = try context.fetch(request)
            return result.map { task in
                    .init(taskCoreData: task)
            }
        } catch {
            return []
        }
    }

    func getTaskById(_ id: UUID) -> TaskModel? {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "taskId == %@", id as CVarArg)
        do {
            let result = try context.fetch(fetchRequest)
            guard let taskEntity = result.first else {
                return nil
            }
            return .init(.init(taskCoreData: taskEntity))
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    func createTask(_ task: TaskModel) {
        let petManager = PetDataManager()
        let newTask = Task(context: context)
        
        newTask.taskId = task.id
        newTask.title = task.title
        newTask.date = task.date
        newTask.pet = petManager.getCoreDataPet(task.pet?.id ?? UUID())
        newTask.frequency = task.frequency?.rawValue
        newTask.type = task.type?.rawValue
        newTask.text = task.text
        newTask.rememberAt = task.rememberAt?.rawValue
        newTask.completed = false
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateTask(_ task: TaskModel) {
        let petManager = PetDataManager()
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "taskId == %@", task.id?.uuidString as? CVarArg ?? [0])
        
        do {
            let result = try context.fetch(fetchRequest)
            let taskEntity = result.first
            
            if let taskEntity = taskEntity {
                taskEntity.date = task.date
                taskEntity.title = task.title
                taskEntity.frequency = task.frequency?.rawValue
                taskEntity.pet = petManager.getCoreDataPet(task.pet?.id ?? UUID())
                taskEntity.type = task.type?.rawValue
                taskEntity.text = task.text
                taskEntity.rememberAt = task.rememberAt?.rawValue
                taskEntity.completed = task.completed ?? true
                try context.save()
            }
        } catch {
            print("Erro ao atualizar task do CoreData: \(error.localizedDescription)")
        }
    }
    
    func deleteTaskById(_ id: UUID) {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "taskId == %@", id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            let taskEntity = result.first
            
            if let taskEntity {
                context.delete(taskEntity)
                try context.save()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getAllPetTasks(_ pet: PetModel) -> [TaskModel] {
        let result = TaskDataManager().getAllTasks().filter({ $0.pet?.name == pet.name })
        return result
    }
}
