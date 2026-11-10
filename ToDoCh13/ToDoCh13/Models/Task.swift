//
//  Task.swift
//  ToDoCh13
//
//  Created by Ariana Osuna  on 04/11/26.
//

import Foundation

// Challenge #1
// i need a model that contains the following atributes
// model name: Task
// id, title, and a isDone
// assing its proper type and remember
//each item needs an ID

struct Task: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isDone: Bool
    
    init(title: String = "New Task", isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
}

let task1: Task = Task(title: "do the minichallenge", isDone: true)




