
//
//  ContentView.swift
//  ToDoList
//
//  Created by Harris Kim on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var showAlert = false
    @State private var newTaskText = ""
    
    var body: some View {
        ZStack{
            VStack(){
                HStack(){
                    Text("To Do List")
                        .font(.title)
                        .padding(20)
                    Spacer()
                    Button(action: {
                        showAlert = true
                    }){
                        Image(systemName: "plus")
                    }.padding(30)
                    
                }
                Spacer()
                List($tasks, id: \.self) { task in
                    TaskCheckMarks(task: task)
                }
            }

            if showAlert{
                CreateTask(isPresented: $showAlert, taskName: $newTaskText, tasks: $tasks)
                    .transition(.scale)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(showAlert ? Color.black.opacity(0.3) : Color.clear)
    }
    
    //func addNewTask(){
        //guard !newTaskText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {return }
        //tasks.append(newTaskText)
    //}
}

#Preview {
    ContentView()
}
