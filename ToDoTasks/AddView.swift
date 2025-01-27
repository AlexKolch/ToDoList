//
//  AddView.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import SwiftUI

struct AddView: View {
    
    @State private var textFieldText = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                    .clipShape(.rect(cornerRadius: 10))
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 10))
                }

            }
            .padding()
        }
        .navigationTitle("Add an item ✍🏼")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
  
}
