//
//  ListRow.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import SwiftUI

struct ListRow: View {
    
    let item: Item
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    Group {
        ListRow(item: Item(title: "Task1", isCompleted: false, order: 1))
        ListRow(item: Item(title: "Task2", isCompleted: true, order: 2))
    }
}
