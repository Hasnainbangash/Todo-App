//
//  AddTodoView.swift
//  Todo App
//
//  Created by Elexoft on 07/03/2025.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) private var presentationMode
    
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
                    
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        } //: LOOP
                    } //: PICKER
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // MARK: - SAVE BUTTON
                    Button(action: {
                        let todo = Todo(context: self.managedObjectContext)
                        todo.name = self.name
                        todo.priority = self.priority
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }) {
                        Text("Save")
                    } //: SAVE BUTTON
                } //: FORM
                
                Spacer()
            } //: VSTACK
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            )
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    AddTodoView()
}
