//
//  ToDoList.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import SwiftUI

struct ToDoList: View {
    
    @EnvironmentObject var vm: ListViewModel
    
    var body: some View {
        List {
            ForEach(vm.tasks) { task in
                ListRow(item: task)
            }
            .onDelete { indexSet in
                vm.deleteItems(at: indexSet)
            }
            .onMove { indexOut, indexIn in
                vm.moveItems(from: indexOut, to: indexIn)
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
    .environmentObject(ListViewModel())
}



