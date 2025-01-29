//
//  Item.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import Foundation

///Immutable Struct
struct Item: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    let order: Int
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, order: Int) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.order = order
    }
    
    ///TaskEntity --> Item
    init(entity: TaskEntity) {
        self.id = entity.id
        self.title = entity.title
        self.isCompleted = entity.isCompleted
        self.order = Int(entity.order)
    }
    
    ///Обновляем статус задачи тут
    func updateSelf() -> Item {
        Item(id: self.id, title: self.title, isCompleted: !self.isCompleted, order: self.order)
    }
}

/*
Item(title: <#T##String#>, isCompleted: <#T##Bool#>) //используем для создания объекта
Item(id: <#T##String#>, title: <#T##String#>, isCompleted: <#T##Bool#>) //для обновления объекта по уже сущ id
*/
