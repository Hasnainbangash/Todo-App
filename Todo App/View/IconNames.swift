//
//  IconNames.swift
//  Todo App
//
//  Created by Elexoft on 11/03/2025.
//

import SwiftUI

class IconNames: ObservableObject {
    var iconNames: [String?] = [nil]
    @Published var currentIndex = 0
    
    init() {
        getAlternateIconName()
        
        // Getting the current icon of the app
        if let currentIcon = UIApplication.shared.alternateIconName {
            //  Setting the current icon index number to the current index
            self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
    }
    
    // Function to get the values from the info plist
    func getAlternateIconName() {
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String : Any], let alternateIcons = icons["CFBundleAlternateIcons"] as? [String : Any] {
            for (_,value) in alternateIcons {
                guard let iconList = value as? Dictionary<String,Any> else { return }
                guard let iconFiles = iconList["CFBundleIconFiles"] as? [String] else { return }
                guard let icon = iconFiles.first else { return }
                
                iconNames.append(icon)
            }
        }
    }
}
