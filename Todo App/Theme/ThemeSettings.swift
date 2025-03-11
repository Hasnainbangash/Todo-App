//
//  ThemeSettings.swift
//  Todo App
//
//  Created by Elexoft on 11/03/2025.
//

import SwiftUI

// MARK: - THEME CLASS

class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
}
