//
//  ProgressHeader.swift
//  ToDoCh13
//
//  Created by Ariana Osuna  on 04/11/26.
//

import SwiftUI

struct ProgressHeader: View {
    
    let tasks:[Task]
    
    
    // computed properties - Variables(Viewa, var, data)
    
    var doneCount:Int {
        //TASK -> LIST OF TASKS
        //LIST -> FILTER -> Predicate == condition
        // RETURNS A NEW LIST OF TASKS THAT
        // FULLFILL THE CONDITION
        
        tasks.filter{$0.isDone}.count
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("My Tasks").font(.title2).bold()
                
                Spacer()
                Text("\(doneCount) / \(tasks.count)")
            }
            
            ProgressView(
                value:Double(doneCount),
                total: Double(tasks.count)
            )
            .tint(.green)
            .animation(.easeInOut, value: doneCount)
            
            
        }.padding()
        
    }
}


#Preview {
    
    ProgressHeader(tasks: [
        Task(title: "hello1", isDone: true),
        Task(title: "hello2", isDone: true),
        Task(title: "hello3", isDone: false)
        ]
    )

}
