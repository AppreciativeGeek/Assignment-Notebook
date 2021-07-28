//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by James on 7/28/21.
//

import SwiftUI

struct AddAssignmentView: View {
    // Defining and getting variables.
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    
    @Environment(\.presentationMode) var presentationMode
    static let courses = [["Math", "plus.slash.minus"], ["Reading", "pencil"], ["Science", "leaf.arrow.circlepath"], ["History", "clock"], ["Georgaphy", "globe"], ["Magic", "wand.and.stars"]]
    
    var body: some View {
        NavigationView {
            // Form that is used to pick values.
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self[0]) { course in
                        HStack {
                            Image(systemName: course[1])
                            Text(course[0])
                        }
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            // Adding navigation bar title and buttons.
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course,
                                        description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
