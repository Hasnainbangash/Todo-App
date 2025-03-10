//
//  SettingsView.swift
//  Todo App
//
//  Created by Elexoft on 10/03/2025.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                // MARK: - FORM
                
                Form {
                    // MARK: - SECTION 4
                    
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "John / Jane")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    } //: SECTION 4
                    .padding(.vertical, 3)
                } //: FORM
                // Grouped List Style adds a grey bar above and below the list and form. With this small modifications we can visually separate the secions in the forms
                .listStyle(GroupedListStyle())
                // Using this modifier we can change the design of the form because we want to enabale this inset style for tjhe group form therefore we must set the horizontal style environment value to compact from regular such as is the case to full screen on ipad like the settings app on the ipad
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - FOOTER
                
                Text("Copyright © All rights reserved.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            } //: VSTACK
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    SettingsView()
}
