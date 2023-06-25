//
//  NoteManager.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 25.06.2023.
//

import Foundation

class NoteManager {
    private let noteDefaultKey = "notePrefferencesKey"
    let userDefault = UserDefaults.standard
    
    
    func getLastUpdateDate()->Date{
        let notes = getNotes()
        return notes.map{ $0.lastUpdateDate}.sorted().last ?? Date()
    }
    
    func addNewNote(note: NoteModel){
        var res = getNotes()
        res.append(note)
        do{
            let encodedData = try JSONEncoder().encode(res)
            userDefault.set(encodedData, forKey: noteDefaultKey)
        }
        catch{
            print("Error occured in setNotes")
        }
    }
    
    func getNotes() -> [NoteModel] {
        if let savedData = userDefault.object(forKey: noteDefaultKey) as? Data{
            do{
                let savedNotes = try JSONDecoder().decode([NoteModel].self, from: savedData)
                return savedNotes
            }
            catch{
                return []
            }
        }
        return []
    }

    func updateNote(id:UUID, title:String?, message:String?){
        let notes = getNotes()
        for i in 0..<notes.count{
            if notes[i].id == id {
                notes[i].update(title: title, message: message)
            }
        }
        do{
            let encodedData = try JSONEncoder().encode(notes)
            userDefault.set(encodedData, forKey: noteDefaultKey)
        }
        catch{
            print("Error occured in updateNote")
        }
    }
    
    func deleteNote(id:UUID){
        var notes = getNotes()
        var index = -1
        for i in 0..<notes.count{
            if notes[i].id == id {
                index = i
            }
        }
        if index == -1 {
            return
        }
        
        do{
            notes.remove(at: index)
            let encodedData = try JSONEncoder().encode(notes)
            userDefault.set(encodedData, forKey: noteDefaultKey)
        }
        catch{
            print("Error occured in deleteNote")
        }
    }
}
