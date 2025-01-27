//
//  ListViewModel.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import Foundation


class ListViewModel: ObservableObject {
    
    @Published var tasks: [Item] = []
    
    init() {
        loadData()
    }
    
    private func loadData() {
        let items = [
        Item(title: "Title", isCompleted: true),
        Item(title: "Title 2", isCompleted: false),
        Item(title: "Title 3", isCompleted: false),
        Item(title: "Title 4", isCompleted: false)
        ]
        self.tasks.append(contentsOf: items)
    }
    
    func deleteItems(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func moveItems(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
}
