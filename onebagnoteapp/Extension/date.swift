//
//  date.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 25.06.2023.
//

import Foundation

extension Date{
    func getFormattedDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .getCustomLocale()
        dateFormatter.dateFormat = "HH:MM, MMM d"
        return dateFormatter.string(from: self)
    }
    
}
