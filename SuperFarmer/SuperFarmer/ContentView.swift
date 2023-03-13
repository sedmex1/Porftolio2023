//
//  ContentView.swift
//  SuperFarmer
//
//  Created by Dominik Kowalewski on 14/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: GameModel
    
    var body: some View {
        MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GameModel())
    }
}
