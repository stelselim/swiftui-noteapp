//
//  onebagnoteappApp.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 22.06.2023.
//

import SwiftUI

@main
struct onebagnoteappApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                HomeScreen()
                    .tabItem{
                        Text(String(localized: "notes"))
                    }
                SettingsScreen()
                    .tabItem{
                        Text(String(localized: "settings"))
                    }
            }
            
        }
    }
}
