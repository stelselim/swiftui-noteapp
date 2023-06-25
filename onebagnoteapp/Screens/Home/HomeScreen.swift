//
//  HomeScreen.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 22.06.2023.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var appState: AppState
    @State var newNote:NoteModel = NoteModel(title: "", message: "")
    @State var isEditModeOn = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(appState.notes, id: \.self.id){ item in
                            if isEditModeOn {
                                HStack{
                                    Text(item.title)
                                    Spacer()
                                    Image(systemName: "minus.circle")
                                        .onTapGesture {
                                            NoteManager().deleteNote(id:item.id)
                                            appState.updateNotes()
                                        }
                                }
                            }else{
                                NavigationLink(destination: NoteScreen(note: item, isNewNote: false)) {
                                    Text(item.title)
                                }
                            }
                        }
                    }
                }
                
                FloatingActionButtonWithoutAction(icon: "plus", note: newNote)
                    .onAppear {
                        newNote = NoteModel(title: "", message: "")
                        appState.updateNotes()
                    }
                
                
            }
            .toolbar{
                Button(action: {
                    isEditModeOn.toggle()
                }){
                    if !isEditModeOn{
                        Text("edit")
                    }else{
                        Text("done")
                    }
                    
                }
                
            }
            .navigationTitle("my_note")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
