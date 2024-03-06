//
//  Calendar.swift
//  ToDoList
//
//  Created by Harris Kim on 2/13/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        CalendarModel()
            .frame(height: 300)
    }
    
}

#Preview {
    CalendarView()
}
