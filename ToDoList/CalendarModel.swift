//
//  CalendarModel.swift
//  ToDoList
//
//  Created by Harris Kim on 2/13/24.
//

import Foundation
import SwiftUI
import FSCalendar
import CoreData

struct CalendarModel: UIViewRepresentable {
    @Environment(\.managedObjectContext) private var viewContext
    func makeUIView(context: Context) -> FSCalendar {
            let calendar = FSCalendar()
            // Configure your calendar here
            return calendar
    }
        
    func updateUIView(_ uiView: FSCalendar, context: Context) {}
        
    // If needed, use a Coordinator to handle delegate methods
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, FSCalendarDelegate {
        var parent: CalendarModel
        
        init(_ calendarModel: CalendarModel) {
            self.parent = calendarModel
            super.init()
        }
        
        // Implement FSCalendarDelegate methods here
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            let request: NSFetchRequest<Task> = Task.fetchRequest()
            request.predicate = NSPredicate(format: "dueDate == %@", argumentArray: [date])
            
            do {
                let tasks = try parent.viewContext.fetch(request)
                return tasks.count
            } catch {
                // Handle the error appropriately
                print("Error fetching tasks: \(error)")
                return 0
            }
        }
        
        
    }
}
