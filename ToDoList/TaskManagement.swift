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
    
    func addTask(name: String, context: NSManagedObjectContext) {
        let task = Task(context: context)
        print("addTask used")
        task.name = name //String
        task.isDone = false //Bool
        task.id = UUID() //UUID
        task.date = Date() //Date
        
        print("addTask set")
        save(context: context)
    }
}
