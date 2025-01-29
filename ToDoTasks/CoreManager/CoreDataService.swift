//
//  CoreDataService.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 28.01.2025.
//

import Foundation
import CoreData

final class CoreDataService {
    
    private let persistentContainer: NSPersistentContainer
    private let containerName = "ToDoContainer"
    private let entityName = "TaskEntity"
    
    @Published var savedEntities: [TaskEntity] = []
    
    init() {
        persistentContainer = NSPersistentContainer(name: containerName)
        persistentContainer.loadPersistentStores { description, error in
            if let error = error as NSError? {
                print("Error loading persistent stores: \(error), \(error.userInfo)")
            }
        }
        fetchTasks()
    }
    
    private func fetchTasks() {
        let request = NSFetchRequest<TaskEntity>(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: "order", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            savedEntities = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching: \(error)")
        }
    }
    
    private func saveData() {
        do {
            try persistentContainer.viewContext.save()
            fetchTasks()
        } catch let error {
            print("Error saving - \(error)")
        }
    }
    
    //MARK: - CRUD Func
    func addTask(id: String, title: String, isCompleted: Bool, order: Int) {
        let newTaskEntity = TaskEntity(context: persistentContainer.viewContext)
        
        newTaskEntity.id = id
        newTaskEntity.title = title
        newTaskEntity.isCompleted = isCompleted
        newTaskEntity.order = Int64(order)

        saveData()
    }
    
    func deleteTask(at indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entityToDelete = savedEntities[index]
        persistentContainer.viewContext.delete(entityToDelete)
        saveData()
    }
    
    func updateTask(entity: Item) throws {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", entity.id)
        
        do {
            let fetchedEntities = try persistentContainer.viewContext.fetch(request)
            guard let fetchedEntity = fetchedEntities.first else { return }
            fetchedEntity.id = entity.id
            fetchedEntity.title = entity.title
            fetchedEntity.isCompleted = entity.isCompleted
            fetchedEntity.order = Int64(entity.order)
//            fetchedEntity.order = Int64(entity.isCompleted ? Int((savedEntities.last?.order ?? 0)) + 1 : entity.order) //реализация смещения вниз списка
            saveData()
        } catch {
            throw error
        }
    }
    
    func moveTask(from: IndexSet, to: Int) {
        guard let itemToMove = from.first else { return }
        
        if itemToMove < to {
            var startIndex = itemToMove + 1
            let endIndex = to - 1
            var startOrder = savedEntities[itemToMove].order
            while startIndex <= endIndex {
                savedEntities[startIndex].order = startOrder
                startOrder += 1
                startIndex += 1
            }
            savedEntities[itemToMove].order = startOrder
        } else if to < itemToMove {
            var startIndex = to
            let endIndex = itemToMove - 1
            var startOrder = savedEntities[to].order + 1
            let newOrder = savedEntities[to].order
            while startIndex <= endIndex {
                savedEntities[startIndex].order = startOrder
                startOrder += 1
                startIndex += 1
            }
            savedEntities[itemToMove].order = newOrder
        }
        saveData()
    }
    
    //Второй вариант сортировки
    /*
        func moveTask(from: IndexSet, to destination: Int) {
            if from.first! > destination {
                savedEntities[from.first!].order = savedEntities[destination].order - 1
                for i in destination...savedEntities.count - 1 {
                    savedEntities[i].order = savedEntities[i].order + 1
                }
            }
          if from.first! < destination {
              savedEntities[from.first!].order = savedEntities[destination - 1].order + 1
              for i in 0...destination - 1 {
                  savedEntities[i].order = savedEntities[i].order - 1
              }
            }
            saveData()
        }
    */
}
