//
//  SettingsView.swift
//  Todo App
//
//  Created by Elexoft on 10/03/2025.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconNames
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                // MARK: - FORM
                
                Form {
                    // MARK: - SECTION 1
                    
                    Section(header: Text("Choose the app icon")) {
                        Picker(selection: $iconSettings.currentIndex, label: Text("App Icons")) {
                            ForEach(0..<iconSettings.iconNames.count) { index in
                                HStack {
                                    // UIImage is used because the image is in app bundle
                                    Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .cornerRadius(8)
                                    
                                    Spacer().frame(width: 8)
                                    
                                    Text(self.iconSettings.iconNames[index] ?? "Blue")
                                        .frame(alignment: .leading)
                                } //: HSTACK
                                .padding(3)
                            } //: LOOP
                        } //: PICKER
                        .pickerStyle(.navigationLink)
                    } //: SECTION 1
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 3
                    
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://swiftuimasterclass.com")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com/robertpetras")
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Courses", link: "https://www.udemy.com/user/robert-petras")
                    } //: SECTION 3
                    .padding(.vertical, 3)
                    
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
            .navigationBarItems(trailing:
                Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            )
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    SettingsView()
        .environmentObject(IconNames())
}
