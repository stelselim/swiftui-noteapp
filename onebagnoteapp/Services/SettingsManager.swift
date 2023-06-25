//
//  SettingsManager.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 22.06.2023.
//

import Foundation

class SettingsManager: ObservableObject{
    private let userDefault = UserDefaults.standard;
    private let initialFontSize = 14
    private let appFontSizePrefferenceKey = "appFontSizePrefferenceKey"
    private let languagePrefferenceKey = "languagePrefferenceKey"
    
    var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    func getPrefferedFontSize() -> Int{
        let font = userDefault.integer(forKey: appFontSizePrefferenceKey)
        if font != 0 {
            return font
        }
        return initialFontSize
    }
    
    func setPrefferedFontSize(fontSize: Int){
        userDefault.setValue(fontSize, forKey: appFontSizePrefferenceKey)
    }
    
    func increaseFontSize(){
        let font = getPrefferedFontSize()
        setPrefferedFontSize(fontSize: font+1)
    }
    
    func decreaseFontSize(){
        let font = getPrefferedFontSize()
        setPrefferedFontSize(fontSize: font-1)
    }
    
    func getPreferredLanguage() -> String{
        return userDefault.string(forKey: languagePrefferenceKey) ?? appLaunguages.first!
    }
    
    func setPreferredLanguage(lang:String){
        userDefault.set(lang, forKey: languagePrefferenceKey)
    }
}
