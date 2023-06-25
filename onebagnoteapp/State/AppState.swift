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
    @Published var lastUpdateDate: Date
    @Published var appVersion: String
    @Published var notes: [NoteModel]

    
    init() {
        self.appLanguage = Locale.getCustomLocale()
        self.appFontSize = SettingsManager().getPrefferedFontSize()
        self.lastUpdateDate = Date()
        self.appVersion = SettingsManager().appVersion
        self.notes = NoteManager().getNotes()
    }
    
    func updateNotes(){
        self.notes = NoteManager().getNotes()
    }
    
    func updateLanguage(){
        self.appLanguage = Locale.getCustomLocale()
    }
    
    func updateFontSize(){
        self.appFontSize = SettingsManager().getPrefferedFontSize()
        
    }
}
