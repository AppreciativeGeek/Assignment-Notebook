//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by James on 7/28/21.
//

import Foundation

// Creating AssignmentList class.
class AssignmentList : ObservableObject {
    // ObservableObject
    @Published var items : [AssignmentItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    
    // Initialization function.
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
