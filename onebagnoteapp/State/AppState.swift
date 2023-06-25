//
//  AppState.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 25.06.2023.
//

import Foundation

class AppState: ObservableObject{
    @Published var appLanguage: Locale
    @Published var appFontSize: Int
    @Published var totalNoteCount: Int
    @Published var lastUpdateDate: Date
    @Published var appVersion: String

    
    init() {
        self.appLanguage = Locale.getCustomLocale()
        self.appFontSize = SettingsManager().getPrefferedFontSize()
        self.totalNoteCount = 0
        self.lastUpdateDate = Date()
        self.appVersion = SettingsManager().appVersion
    }
    
    func updateLanguage(){
        self.appLanguage = Locale.getCustomLocale()
    }
    
    func updateFontSize(){
        self.appFontSize = SettingsManager().getPrefferedFontSize()
        
    }
}
