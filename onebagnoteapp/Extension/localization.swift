//
//  localization.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 25.06.2023.
//

import Foundation

extension Locale{
    static func getCustomLocale() -> Locale{
        let language = SettingsManager().getPreferredLanguage()
        let locale = Locale(identifier: appLaungageDict[language]!)
        return locale
    }
}
