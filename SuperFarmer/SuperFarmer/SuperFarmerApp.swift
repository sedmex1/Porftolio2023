//
//  SuperFarmerApp.swift
//  SuperFarmer
//
//  Created by Dominik Kowalewski on 14/11/2022.
//

import SwiftUI

@main
struct SuperFarmerApp: App {
    
    @EnvironmentObject var model: GameModel
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(GameModel())
        }
    }
}
