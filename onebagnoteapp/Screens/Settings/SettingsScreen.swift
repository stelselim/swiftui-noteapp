//
//  SettingsScreen.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 22.06.2023.
//

import SwiftUI

struct SettingsScreen: View {
    @State var language = SettingsManager().getLanguage()
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    Picker(String(localized: "language"), selection: $language){
                        ForEach(appLaunguages, id: \.self){ lang in
                            Text(lang)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(NSLocalizedString("settings", comment: "App's Settings"))
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
