//
//  ContentView.swift
//  ToDoCh13
//
//  Created by Ariana Osuna  on 04/11/26.
//

//Models
//Views
//ViewModels

import SwiftUI

struct ContentView: View {

    @State var tasks: [Task] = [
        Task(title: "hello1", isDone: true),
        Task(title: "hello2", isDone: false),
        Task(title: "hello3", isDone: true),
        Task(title: "hello4", isDone: true),
        Task(title: "hello5", isDone: false)
    ]

    @State private var newTaskTitle: String = ""

    var body: some View {
        ScrollView {
            VStack {
                ProgressHeader(tasks: tasks)

                // Form area
                HStack {
                    TextField("New task...", text: $newTaskTitle)
                        .textFieldStyle(.roundedBorder)

                    Button("Add") {
                        withAnimation(.easeInOut) {
                            tasks.append(Task(title: newTaskTitle))
                        }
                        newTaskTitle = ""
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(.horizontal)

                LazyVStack(spacing: 12) {
                    ForEach($tasks) { $item in
                        TaskRow(task: $item)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
                .padding(.top)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
