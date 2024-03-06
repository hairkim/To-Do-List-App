////
////  Task.swift
////  ToDoList
////
////  Created by Harris Kim on 2/10/24.
////
//
//import Foundation
//
//struct Task: Identifiable, Hashable{
//    let id = UUID()
//    var name: String
//    var isDone: Bool
//}
//
//class TaskViewModel: ObservableObject {
//    @Published var tasks: [Task] = []
//    
//    func delete(taskID: UUID) {
//        tasks.removeAll { $0.id == taskID }
//    }
//    
//    func checkDone(for taskID: UUID){
//        if let index = tasks.firstIndex(where: { $0.id == taskID }) {
//            tasks[index].isDone.toggle()
//        }
//    }
//    
//    func createTask(task: Task){
//        tasks.append(task)
//    }
//    
//}
