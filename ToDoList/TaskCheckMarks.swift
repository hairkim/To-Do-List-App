//
//  TaskCheckMarks.swift
//  ToDoList
//
//  Created by Harris Kim on 2/10/24.
//

import SwiftUI

struct TaskCheckMarks: View {
    @Binding var task: Task
    var body: some View {
        HStack {
            Button(action: {
                task.isDone.toggle()
            }) {
                Image(systemName: task.isDone ? "checkmark.square.fill" : "square")
                    .foregroundColor(task.isDone ? .blue: .gray)
            }
            Text(task.name)
            Spacer()
        }
    }
}

#Preview {
    TaskCheckMarks(task: .constant(Task(name: "New Task", isDone: false)))
}
