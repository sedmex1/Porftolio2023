//
//  DicesView.swift
//  SuperFarmer
//
//  Created by Dominik Kowalewski on 16/11/2022.
//

import SwiftUI

struct DicesView: View {
    
    @EnvironmentObject var model: GameModel
    
    @State private var degrees = 0.0
    
    var body: some View {
        VStack {
            
            HStack (spacing: 30){
                
                //MARK: Dice 1
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 10)
                        .rotation3DEffect(Angle(degrees: -360 * degrees), axis: (x: 1, y: 1, z: 100))
                        .animation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.9), value: degrees)
                        .onChange(of: model.game.dice1) { newValue in
                            degrees += 1
                            
                            if degrees > 2 {
                                degrees = 0
                            }
                        }
                    
                    Text(model.game.dice1 == "bunny" ? "🐰" : model.game.dice1 == "sheep" ? "🐑" : model.game.dice1 == "pig" ? "🐖" : model.game.dice1 == "cow" ? "🐄" : model.game.dice1 == "horse" ? "🐎" : model.game.dice1 == "fox" ? "🦊" : model.game.dice1 == "wolf" ? "🐺" : "🎲")
                        .font(.largeTitle)
                        .rotation3DEffect(Angle(degrees: -360 * degrees), axis: (x: 10, y: 10, z: 0))
                        .animation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.9), value: degrees)
                        .onChange(of: model.game.dice1) { newValue in
                            degrees += 1
                            
                            if degrees > 2 {
                                degrees = 0
                            }
                        }
                }
                
                //MARK: Dice 2
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 10)
                        .rotation3DEffect(Angle(degrees: 360 * degrees), axis: (x: 1, y: 1, z: 100))
                        .animation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.9), value: degrees)
                        .onChange(of: model.game.dice2) { newValue in
                            degrees += 1
                            
                            if degrees > 2 {
                                degrees = 0
                            }
                        }
                    
                    Text(model.game.dice2 == "bunny" ? "🐰" : model.game.dice2 == "sheep" ? "🐑" : model.game.dice2 == "pig" ? "🐖" : model.game.dice2 == "cow" ? "🐄" : model.game.dice2 == "horse" ? "🐎" : model.game.dice2 == "fox" ? "🦊" : model.game.dice2 == "wolf" ? "🐺" : "🎲")
                        .font(.largeTitle)
                        .rotation3DEffect(Angle(degrees: -360 * degrees), axis: (x: 10, y: 10, z: 0))
                        .animation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.9), value: degrees)
                        .onChange(of: model.game.dice1) { newValue in
                            degrees += 1
                            
                            if degrees > 2 {
                                degrees = 0
                            }
                        }
                }
            }
        }
    }
}
