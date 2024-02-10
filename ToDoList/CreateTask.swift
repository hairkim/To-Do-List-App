//
//  CreateTask.swift
//  ToDoList
//
//  Created by Harris Kim on 2/10/24.
//

import SwiftUI

struct CreateTask: View {
    @Binding var isPresented: Bool
    @Binding var taskName: String
    @Binding var tasks: [Task]
    var body: some View {
        VStack(spacing: 10){
            Text("Create New Task")
                .font(.title)
            TextField("Enter Task: ", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add"){
                isPresented = false
                let newTask = Task(name: taskName, isDone: false)
                tasks.append(newTask)
                
                taskName = ""
            }
            .padding(9)
            .background(Color.blue.cornerRadius(10))
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)
            )
            
            
            Button("Cancel"){
                isPresented = false
            }
            .padding(9)
            .background(Color.blue.cornerRadius(10))
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)
            )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .frame(width: 300)
    }
}

#Preview {
    CreateTask(isPresented: .constant(true), taskName: .constant("New Task"), tasks: .constant([Task(name: "Example Task", isDone: false)]))
}
