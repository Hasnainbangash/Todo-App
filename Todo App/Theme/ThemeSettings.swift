//
//  ThemeSettings.swift
//  Todo App
//
//  Created by Elexoft on 11/03/2025.
//

import SwiftUI

// MARK: - THEME CLASS

/*
 // Old Code that works when the apps gets restart
 class ThemeSettings: ObservableObject {
     @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
         didSet {
             UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
         }
     }
 }
 */


// MARK: - NEW CODE (Kudos to Ken Ishimoto from Japan)
 
final public class ThemeSettings: ObservableObject {
  @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
    didSet {
      UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
    }
  }
 
  private init() {}
  public static let shared = ThemeSettings()
}
