//
//  ToDoList.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import SwiftUI

struct ToDoList: View {
    
    @State private var tasks: [Item] = [
        Item(title: "Title", isCompleted: true),
        Item(title: "Title 2", isCompleted: false),
        Item(title: "Title 3", isCompleted: false),
        Item(title: "Title 4", isCompleted: false),
    ]
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                ListRow(item: task)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Tasks ✏️")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

#Preview {
    NavigationStack{
        ToDoList()
    }
}



