//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by James on 7/28/21.
//

import Foundation

class AssignmentList : ObservableObject {
    @Published var items = [AssignmentItem(course: "Math", description: "Finish Assignment", dueDate: Date()),
                            AssignmentItem(course: "Reading", description: "Read 10 pages of a book.", dueDate: Date()),
                            AssignmentItem(course: "Science", description: "Follow Experient Instructions", dueDate: Date())]
}
