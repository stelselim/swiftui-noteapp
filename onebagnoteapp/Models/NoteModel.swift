//
//  NoteModel.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 25.06.2023.
//

import Foundation

class NoteModel: Codable, Identifiable, ObservableObject{
    let id: UUID
    var title: String
    var message: String
    let createDate: Date
    var lastUpdateDate: Date
    
    init(title: String, message: String) {
        self.id = UUID()
        self.title = title
        self.message = message
        self.createDate = Date()
        self.lastUpdateDate = Date()
    }
    
    func update(title:String?, message:String?){
        self.title = title ?? self.title
        self.message = title ?? self.message
        self.lastUpdateDate = Date()
    }
}
