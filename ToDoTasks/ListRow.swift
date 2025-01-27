//
//  ListRow.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import SwiftUI

struct ListRow: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ListRow(title: "Title")
}
