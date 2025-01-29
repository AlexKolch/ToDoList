//
//  ListViewModel.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    
    @Published var tasks: [Item] = []
    
    private var container = CoreDataService()
    private let tasksKey = "tasks"
    var taskCancellable: AnyCancellable?
    
    init() {
        addSubscibers()
    }
    
    private func addSubscibers() {
        taskCancellable = container.$savedEntities
            .map { taskEntities -> [Item] in
                let tasks = taskEntities
                    .map { Item(entity: $0) }
                return tasks
            }
            .sink { [weak self] returnedTasks in
                self?.tasks = returnedTasks
            }
    }
    
    //MARK: - Base Functions for work with data. Create/Read/Update/Delete
    func addTask(title: String) {
        let order = (tasks.last?.order ?? 0) + 1
        let task = Item(title: title, isCompleted: false, order: order)
        
        container.addTask(id: task.id, title: task.title, isCompleted: task.isCompleted, order: order)
    }
    
    func deleteItems(at offsets: IndexSet) {
        container.deleteTask(at: offsets)
    }
    
    func updateTask(item: Item) {
        let updatedTask = item.updateSelf() //возвращается объект с таким же id, но с обновленным статусом!
        
        do {
            try container.updateTask(entity: updatedTask)
        } catch {
            print("Error updateTask: \(error)")
        }
    }
    
    func moveItems(from: IndexSet, to: Int) {
        container.moveTask(from: from, to: to)
    }
    
}
