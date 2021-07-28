//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by James on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
        [AssignmentItem(course: "Math", description: "Finish Assignment", dueDate: Date()),
         AssignmentItem(course: "Reading", description: "Read 10 pages of a book.", dueDate: Date()),
         AssignmentItem(course: "Science", description: "Follow Experient Instructions", dueDate: Date())]
    
    var body: some View {
        NavigationView {
            List {
                ForEach (assignmentItems) { item in
                    Text(item.description)
                }
            }
            .navigationTitle("Assignment Notebook")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem : Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
