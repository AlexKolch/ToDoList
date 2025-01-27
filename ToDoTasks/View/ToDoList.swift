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
        ZStack {
            if vm.tasks.isEmpty {
               NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                todoList
            }
        }
        .navigationTitle("Tasks ✏️")
        .toolbar {
            !vm.tasks.isEmpty ?
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            : nil
           
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
        .font(.headline)
    }
  
}

private extension ToDoList {
    
    var todoList: some View {
        List {
            ForEach(vm.tasks) { item in
                ListRow(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            vm.updateTask(item: item)
                        }
                    }
            }
            .onDelete { indexSet in
                vm.deleteItems(at: indexSet)
            }
            .onMove { indexOut, indexIn in
                vm.moveItems(from: indexOut, to: indexIn)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack{
        ToDoList()
    }
    .environmentObject(ListViewModel())
}
