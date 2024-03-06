//
//  TaskManagement.swift
//  ToDoList
//
//  Created by Harris Kim on 3/5/24.
//

import Foundation
import CoreData

class TaskManagement: ObservableObject {
    static let shared = TaskManagement()
    let container = NSPersistentContainer(name: "TaskData")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            let nserror = error as NSError
            print("error \(nserror), \(nserror.userInfo)")
            //print("We could not save data")
        }
    }
    
    func addTask(name: String, dueDate: Date, context: NSManagedObjectContext) {
        let task = Task(context: context)
        task.name = name //String
        task.isDone = false //Bool
        task.id = UUID() //UUID
        task.date = Date() //Date
        task.dueDate = dueDate //Date
        
        save(context: context)
    }
}
