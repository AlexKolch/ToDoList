//
//  Item.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import Foundation

///Immutable Struct
struct Item: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    ///Обновляем статус задачи тут
    func updateSelf() -> Item {
        Item(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
}

/*
Item(title: <#T##String#>, isCompleted: <#T##Bool#>) //используем для создания объекта
Item(id: <#T##String#>, title: <#T##String#>, isCompleted: <#T##Bool#>) //для обновления объекта по уже сущ id
*/
