
//
//  ContentView.swift
//  ToDoList
//
//  Created by Harris Kim on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var taskViewModel = TaskViewModel()
    @State private var showAlert = false
    @State private var newTaskText = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(){ //for the main
                    HStack(){ //is for the top of the page
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
//                    ForEach(taskViewModel.tasks) { task in
//                        TaskCheckMarks(viewModel: taskViewModel, taskID: task.id)
//                    }
                    List(taskViewModel.tasks) { task in
                        TaskCheckMarks(viewModel: taskViewModel, taskID: task.id)
                            .contentShape(Rectangle())
                            .onTapGesture{}
                            .buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                    HStack(spacing: 150){
                        Button(action: {
                            //switch view
                        }) {
                            Image(systemName: "list.bullet.clipboard.fill")
                        }
                        Button(action: {
                            //switch view
                        }) {
                            Image(systemName: "book.fill")
                        }
                    }
                }

                if showAlert{
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showAlert = false
                        }
                    CreateTask(isPresented: $showAlert, taskName: $newTaskText, taskViewModel: taskViewModel)
                        .transition(.scale)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(showAlert ? Color.black.opacity(0.3) : Color.clear)

        }
    }
    
}

#Preview {
    ContentView()
}
