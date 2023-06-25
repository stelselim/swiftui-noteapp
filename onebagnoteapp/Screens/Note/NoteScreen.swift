//
//  NoteScreen.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 25.06.2023.
//

import SwiftUI

struct NoteScreen: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var note: NoteModel
    let isNewNote: Bool
    
    @State var title = ""
    @State var message = ""
    
    var body: some View {
        ZStack{
            List{
                Section(header: Text("title")){
                    TextField("enter_title", text: $title, axis: .vertical)
                        .lineLimit(3)
                        .frame(maxHeight: 80)
                        .multilineTextAlignment(.leading)
                    
                }
                Section(header: Text("message")){
                    TextField("enter_message", text: $message, axis: .vertical)
                        .lineLimit(10...15)
                        .frame(maxHeight: 320)
                        .multilineTextAlignment(.leading)
                }
                
            }
            
            FloatingActionButton(icon: "checkmark"){
                if isNewNote{
                    NoteManager().addNewNote(note: NoteModel(title: title, message: message))
                    dismiss()
                }else{
                    NoteManager().updateNote(id: note.id, title: title, message: message)
                    dismiss()
                }
            }
        }
        .onAppear{
            title = note.title
            message = note.message
        }
        
    }
}

