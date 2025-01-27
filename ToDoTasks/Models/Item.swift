//
//  Item.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import Foundation

struct Item: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
