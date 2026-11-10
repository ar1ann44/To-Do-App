//
//  TaskRow.swift
//  ToDoCh13
//
//  Created by Ariana Osuna  on 04/11/26.
//

import SwiftUI

struct TaskRow:View {
    
    // @State, @Binding
    
    //View Model
    //
    
    @Binding var task:Task
    
    var body: some View {
        HStack(spacing: 12){
            
            Image(systemName: task.isDone ?
                  "checkmark.circle.fill": "circle")
            .foregroundStyle(task.isDone ? .green : .secondary)
            .font(.title2)
            
            Text(task.title)
                .font(.body)
                .strikethrough(task.isDone)
                .opacity(task.isDone ? 0.4 : 1.0)
                .animation(.easeInOut(duration: 0.25), value:task.isDone)
            
            Spacer()
            
        }.padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.secondarySystemBackground))
            )
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.20)) {
                    task.isDone.toggle()
                }
            }
    }
}
