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

    func getTaskById(_ id: UUID) -> TaskModel? {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
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
                try context.save()
            }
        } catch {
            print("Erro ao atualizar pet do CoreData: \(error.localizedDescription)")
        }
    }
    
    func deleteTaskById(_ id: UUID) {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
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
}
