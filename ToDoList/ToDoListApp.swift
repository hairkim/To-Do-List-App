//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Harris Kim on 2/10/24.
//

import SwiftUI
import CoreData

@main
struct ToDoListApp: App {
    @StateObject private var taskManager = TaskManagement()
    var body: some Scene {
        WindowGroup{
            CreateTask(isPresented: .constant(true), taskName: .constant("New Task"))
                .environment(\.managedObjectContext, taskManager.container.viewContext)
        }
    }
}
