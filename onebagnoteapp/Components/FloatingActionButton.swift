//
//  FloatingActionButton.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 25.06.2023.
//

import SwiftUI

struct FloatingActionButtonWithoutAction: View{
    let icon: String
    let note: NoteModel
    
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                
                NavigationLink(
                    destination: NoteScreen(note: note,isNewNote: true)
                ){
                    Image(systemName: icon)
                        .font(.system(size: 27))
                        .foregroundColor(Color("white"))
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .offset(x: -35, y: -20)
                    
                }
                
            }
        }
    }
}


struct FloatingActionButton: View{
    let icon: String
    let action: ()->Void
    
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                
                Button(action: action){
                    Image(systemName: icon)
                        .font(.system(size: 27))
                        .foregroundColor(Color("white"))
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .offset(x: -35, y: -20)
                    
                }
                
            }
        }
    }
}
