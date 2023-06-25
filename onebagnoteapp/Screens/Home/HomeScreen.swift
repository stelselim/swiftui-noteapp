//
//  HomeScreen.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 22.06.2023.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var appState: AppState
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("my_note")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
