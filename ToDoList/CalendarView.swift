//
//  Calendar.swift
//  ToDoList
//
//  Created by Harris Kim on 2/13/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedTasks: [Task] = []
    @State private var selectedDate: Date?
    
    var body: some View {
        VStack {
            CalendarModel()
                .frame(height: 300)
            List(selectedTasks, id: \.self) { task in
                Text(task.name ?? "Unnamed Task")
            }
        }
    }
    
}

#Preview {
    CalendarView()
}
