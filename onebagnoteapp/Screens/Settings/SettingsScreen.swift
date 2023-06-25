//
//  SettingsScreen.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 22.06.2023.
//

import SwiftUI

struct SettingsScreen: View {
    @ObservedObject var appState: AppState
    @State var language = SettingsManager().getPreferredLanguage()
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    Picker("language", selection: $language){
                        ForEach(appLaunguages, id: \.self){ lang in
                            Text(lang)
                        }
                    }
                    .onChange(of: language){ val in
                        SettingsManager().setPreferredLanguage(lang: val)
                        appState.updateLanguage()
                    }
                    
                    HStack{
                        Text("font_size")
                        Spacer()
                        Image(systemName: "minus.circle")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .onTapGesture {
                                SettingsManager().decreaseFontSize()
                                appState.updateFontSize()
                            }
                        Text("\(appState.appFontSize)")
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .onTapGesture {
                                SettingsManager().increaseFontSize()
                                appState.updateFontSize()
                            }
                        
                    }
                    
                }
                Section {
                    HStack{
                        Text("total_note")
                        Spacer()
                        Text("\(appState.totalNoteCount)")
                    }
                    
                    HStack{
                        Text("last_note_update")
                        Spacer()
                        Text("\(appState.lastUpdateDate.getFormattedDate())")
                    }
                }

                Section {
                    HStack{
                        Text("app_version")
                        Spacer()
                        Text("\(appState.appVersion)")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("settings")
        }
    }
}
