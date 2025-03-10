//
//  ContentView.swift
//  Todo App
//
//  Created by Elexoft on 07/03/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.todos, id: \.self) { todo in
                    HStack {
                        Text(todo.name ?? "Unknown")
                        
                        Spacer()
                        
                        Text(todo.priority ?? "Unknown")
                    } //: HSTACK
                } //: FOREACH
            } //: LIST
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddTodoView.toggle()
                }) {
                    Image(systemName: "plus")
                } //: ADD BUTTON
                .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
                }
            )
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
