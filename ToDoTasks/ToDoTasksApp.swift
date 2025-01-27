//
//  ToDoTasksApp.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import SwiftUI

@main
struct ToDoTasksApp: App {
    
    @StateObject var vm: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ToDoList()
            }
            .environmentObject(vm) //будет один источник данных для всех view
        }
    }
}
