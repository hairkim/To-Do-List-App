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
        var tasksForDates: [Date: [Task]] = [:]
        
        init(_ calendarModel: CalendarModel) {
            self.parent = calendarModel
            super.init()
        }
        
        // Implement FSCalendarDelegate methods here
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            let calendar = Calendar.current
            let startDate = calendar.startOfDay(for: date)
            let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
            
            let request: NSFetchRequest<Task> = Task.fetchRequest()
            request.predicate = NSPredicate(format: "(date >= %@) AND (date < %@)", argumentArray: [startDate, endDate])
            
            do {
                let tasks = try parent.viewContext.fetch(request)
                return tasks.count
            } catch {
                // Handle the error appropriately
                print("Error fetching tasks: \(error)")
                return 0
            }
        }
        
        func tasks(for date: Date) -> [Task] {
            tasksForDates[date, default: []]
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            let tasks = self.tasks(for: date)
            // Now you can print the tasks or pass them to your view to be displayed
            for task in tasks {
                print("Task: \(String(describing: task.name)), Date: \(String(describing: task.date)), ID: \(String(describing: task.id))")
            }
        }
        
    }
}
