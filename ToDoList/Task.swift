//
//  Task.swift
//  ToDoList
//
//  Created by Harris Kim on 2/10/24.
//

import Foundation

struct Task: Identifiable, Hashable{
    let id = UUID()
    var name: String
    var isDone: Bool
}
