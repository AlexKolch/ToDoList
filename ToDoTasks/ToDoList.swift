//
//  ToDoList.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import SwiftUI

struct ToDoList: View {
    
    @State private var tasks: [String] = [
        "Title",
        "Title2",
        "Title3"
    ]
    
    var body: some View {
        List {
            ForEach(tasks, id: \.self) { task in
                ListRow(title: task)
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



