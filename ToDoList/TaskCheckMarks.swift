//
//  TaskCheckMarks.swift
//  ToDoList
//
//  Created by Harris Kim on 2/10/24.
//

import SwiftUI

struct TaskCheckMarks: View {
    @ObservedObject var viewModel: TaskViewModel
    let taskID: UUID
    
    private var task: Task? {
        viewModel.tasks.first(where: { $0.id == taskID })
    }
    var body: some View {
        HStack {
            Button(action: {
                if let taskID = task?.id {
                    viewModel.checkDone(for: taskID)
                }
                }) {
                    Image(systemName: task?.isDone ?? false ? "checkmark.square.fill" : "square")
                        .foregroundColor(task?.isDone ?? false ? .blue : .gray)
                }
            .padding()
            .contentShape(Rectangle())
            Text(task?.name ?? "unknown task")
            Spacer()
            Button(action: {
                viewModel.delete(taskID: taskID)
            }) {
                Image(systemName: "trash")
            }
            .padding()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.checkDone(for: taskID)
        }
    }
}
                   

#Preview {
    let viewModel = TaskViewModel()
    let task = Task(name: "Sample Task", isDone: false)
    viewModel.tasks.append(task)
    return TaskCheckMarks(viewModel: viewModel, taskID: task.id)
}
