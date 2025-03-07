//
//  AddTodoView.swift
//  Todo App
//
//  Created by Elexoft on 07/03/2025.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTIES
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - TODO NAME
                    TextField("Todo", text: $name)
                } //: FORM
                
                Spacer()
            } //: VSTACK
            .navigationBarTitle("New Todo", displayMode: .inline)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    AddTodoView()
}
