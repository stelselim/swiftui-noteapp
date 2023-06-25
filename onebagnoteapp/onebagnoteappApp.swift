//
//  onebagnoteappApp.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 22.06.2023.
//

import SwiftUI

@main
struct onebagnoteappApp: App {
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            TabView{
                HomeScreen(appState: appState)
                    .tabItem{
                        Text("notes")
                    }
                SettingsScreen(appState: appState)
                    .tabItem{
                        Text("settings")
                    }
            }
            .font(.system(size: CGFloat(appState.appFontSize)))
            .environmentObject(appState)
            .environment(\.locale, appState.appLanguage)
        }
    }
}
