//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by James on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    // Defining variables.
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    
    var body: some View {
        NavigationView {
            List {
                // Displaying each assignment.
                ForEach (assignmentList.items) { item in
                    HStack {
                        VStack (alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    // Updating assingment list when items are moved.
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    // Updating assignment list when items are deleted.
                    assignmentList.items.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {
                // Adding Assignment sheet.
                AddAssignmentView(assignmentList: assignmentList)
            })
            // Added Navigation Titles and Buttons.
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "square.and.pencil")
                        Text("Assignment Notebook")
                            .font(.title2)
                            .bold()
                    }
                }
            })
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {showingAddAssignmentView = true}) {
                                    Image(systemName: "plus")
                                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Creating AssignmentItem Structure
struct AssignmentItem : Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
