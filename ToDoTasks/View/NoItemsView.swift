//
//  NoItemsView.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 27.01.2025.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animation: Bool = false
    
    var body: some View {
        VStack(spacing: 12.0) {
            Text("There are no items!")
                .font(.title.bold())
            Text("No tasks yet. You should click the add button and add something to your todo list")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            NavigationLink(destination: AddView()) {
                Text("Add Something 🥳")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animation ? Color.accentColor : Color.secondaryAccent) //анимируем цвет кнопки
//                    .background(animation ? Color.purple : Color.accentColor) //анимируем цвет кнопки
                    .clipShape(.capsule)
            }
            .padding(.horizontal, animation ? 30 : 50) //анимируем размер кнопки
            .shadow(color: animation ? Color.accentColor.opacity(0.7) : Color.secondaryAccent.opacity(0.7),
                    radius: animation ? 30 : 10,
                    x: 0.0,
                    y: animation ? 50.0 : 30.0)
            .scaleEffect(animation ? 1.1 : 1.0) //анимируем scale кнопки
            .offset(y: animation ? -3 : 0)
        }
        .padding(40)
        .onAppear(perform: addAnimation) //запуск анимации
    }
    
    private func addAnimation() {
        guard !animation else { return } //чтобы не запускать анимацию повторно
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animation.toggle()
            }
        }
    }
}


#Preview {
    NoItemsView()
}
