//
//  AddView.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ListViewModel
    @State private var textFieldText = ""
    
    private let alertTitle: String = "Your task should be at least 3 characters long! 🫣"
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: 800) //ограничение для ipad
                    .background(Color(uiColor: .secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 10))
                
                Button {
                    saveBtnPressed() } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: 800) //ограничение для ipad
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
            .padding()
        }
        .navigationTitle("Add an item ✍🏼")
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK") { }
        }
    }
    
    private func saveBtnPressed() {
        guard textValidation() else {
            return
        }
        vm.addTask(title: textFieldText)
        dismiss()
    }
    
    private func textValidation() -> Bool {
        if textFieldText.count < 3 {
            showAlert.toggle()
            return false
        }
        return true
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
  
}
