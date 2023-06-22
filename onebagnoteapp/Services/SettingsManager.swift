//
//  SettingsManager.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 22.06.2023.
//

import Foundation

class SettingsManager{
    private var prefferedLanguage :String = appLaunguages.first!
    
    func getLanguage() -> String {
        return prefferedLanguage;
    }
}
