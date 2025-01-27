//
//  ListViewModel.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import Foundation 

class ListViewModel: ObservableObject {
    
    @Published var tasks: [Item] = [] {
        didSet {
            saveItems() //сохранение изменений
        }
    }
    private let tasksKey = "tasks"
    
    init() {
        loadData()
    }
    
    private func loadData() {
        guard
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let savedTasks = try? JSONDecoder().decode([Item].self, from: data)
        else { return }
        self.tasks = savedTasks
    }
    
    //MARK: - Base Functions for work with data
    func deleteItems(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func moveItems(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(title: String) {
        tasks.append(Item(title: title, isCompleted: false))
    }
    
    func updateTask(item: Item) {
        //находим id переданного элемента с id в массиве чтобы редактировать нужный элемент в массиве
//        if let index = tasks.firstIndex { existingItem in
//            return existingItem.id == item.id
//        } {
//            
//        }
        
        if let index = tasks.firstIndex(where: { $0.id == item.id }) {
            //получаем доступ к нужному объекту в массиве и обновляем его
            tasks[index] = item.updateSelf() //возвращается объект с таким же id, но с обновленным статусом!
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
}
