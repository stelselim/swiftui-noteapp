//
//  HomeScreen.swift
//  onebagnoteapp
//
//  Created by Selim Üstel on 22.06.2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle(NSLocalizedString("my_note",comment: "The notes section header"))
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
