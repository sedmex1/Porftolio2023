//
//  PlayerCardsView.swift
//  SuperFarmer
//
//  Created by Dominik Kowalewski on 27/11/2022.
//

import SwiftUI

struct PlayerCardsView: View {
    
    @EnvironmentObject var model: GameModel
    
    var body: some View {
        VStack (spacing: 20) {
            
            HStack(spacing: 30) {
                ZStack {
                    HStack {
                        Text("🐰")
                            .font(.largeTitle)
                            .shadow(radius: 5)
                        Text("\(model.game.player.bunny)")
                            .font(.title2)
                            .bold()
                            .shadow(radius: 5)
                            .animation(.easeInOut(duration: 0.1), value: model.game.player.bunny)
                    }
                    .frame(width: UIScreen.main.bounds.width / 4, height: 50)
                    .background(!model.game.lowSpec ? .ultraThinMaterial : Material.ultraThick)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .foregroundColor(!model.game.lowSpec ? .white : .black)
                    
                    Image(systemName: "shield.fill")
                        .resizable()
                        .frame(width: 20, height: 22)
                        .foregroundColor(.yellow)
                        .shadow(color: .black.opacity(0.6), radius: 7, x: 0, y: 0)
                        .scaleEffect(model.game.player.smallDog ? 1 : 0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.45, blendDuration: 0.7), value: model.game.player.smallDog)
                        .offset(x: 44, y: -22)
                }
                
                ZStack {
                    HStack {
                        Text("🐑")
                            .font(.largeTitle)
                            .shadow(radius: 5)
                        Text("\(model.game.player.sheep)")
                            .font(.title2)
                            .bold()
                            .shadow(radius: 5)
                            .animation(.easeInOut(duration: 0.1), value: model.game.player.sheep)
                    }
                    .frame(width: UIScreen.main.bounds.width / 4, height: 50)
                    .background(!model.game.lowSpec ? .ultraThinMaterial : Material.ultraThick)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .foregroundColor(!model.game.lowSpec ? .white : .black)
                    
                    Image(systemName: "shield.fill")
                        .resizable()
                        .frame(width: 20, height: 22)
                        .foregroundColor(.yellow)
                        .shadow(color: .black.opacity(0.6), radius: 7, x: 0, y: 0)
                        .scaleEffect(model.game.player.bigDog ? 1 : 0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.45, blendDuration: 0.7), value: model.game.player.bigDog)
                        .offset(x: 44, y: -22)
                }
                
                ZStack {
                    HStack {
                        Text("🐖")
                            .font(.largeTitle)
                            .shadow(radius: 5)
                        Text("\(model.game.player.pig)")
                            .font(.title2)
                            .bold()
                            .shadow(radius: 5)
                            .animation(.easeInOut(duration: 0.1), value: model.game.player.pig)
                    }
                    .frame(width: UIScreen.main.bounds.width / 4, height: 50)
                    .background(!model.game.lowSpec ? .ultraThinMaterial : Material.ultraThick)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .foregroundColor(!model.game.lowSpec ? .white : .black)
                    
                    Image(systemName: "shield.fill")
                        .resizable()
                        .frame(width: 20, height: 22)
                        .foregroundColor(.yellow)
                        .shadow(color: .black.opacity(0.6), radius: 7, x: 0, y: 0)
                        .scaleEffect(model.game.player.bigDog ? 1 : 0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.45, blendDuration: 0.7), value: model.game.player.bigDog)
                        .offset(x: 44, y: -22)
                }
            }
                
                HStack (spacing: 20) {
                    ZStack {
                        HStack {
                            Text("🐄")
                                .font(.largeTitle)
                                .shadow(radius: 5)
                            Text("\(model.game.player.cow)")
                                .font(.title2)
                                .bold()
                                .shadow(radius: 5)
                                .animation(.easeInOut(duration: 0.1), value: model.game.player.cow)
                        }
                        .frame(width: UIScreen.main.bounds.width / 4, height: 50)
                        .background(!model.game.lowSpec ? .ultraThinMaterial : Material.ultraThick)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .foregroundColor(!model.game.lowSpec ? .white : .black)
                        
                        Image(systemName: "shield.fill")
                            .resizable()
                            .frame(width: 20, height: 22)
                            .foregroundColor(.yellow)
                            .shadow(color: .black.opacity(0.6), radius: 7, x: 0, y: 0)
                            .scaleEffect(model.game.player.bigDog ? 1 : 0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.45, blendDuration: 0.7), value: model.game.player.bigDog)
                            .offset(x: 44, y: -22)
                    }
                    
                    ZStack {
                        HStack {
                            Text("🐎")
                                .font(.largeTitle)
                                .shadow(radius: 5)
                            Text("\(model.game.player.horse)")
                                .font(.title2)
                                .bold()
                                .shadow(radius: 5)
                                .animation(.easeInOut(duration: 0.1), value: model.game.player.horse)
                        }
                        .frame(width: UIScreen.main.bounds.width / 4, height: 50)
                        .background(!model.game.lowSpec ? .ultraThinMaterial : Material.ultraThick)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .foregroundColor(!model.game.lowSpec ? .white : .black)
                        
                        Image(systemName: "shield.fill")
                            .resizable()
                            .frame(width: 20, height: 22)
                            .foregroundColor(.yellow)
                            .shadow(color: .black.opacity(0.6), radius: 7, x: 0, y: 0)
                            .scaleEffect(model.game.player.bigDog ? 1 : 0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.45, blendDuration: 0.7), value: model.game.player.bigDog)
                            .offset(x: 44, y: -22)
                    }
                    
                    HStack {
                        Text("🐕")
                            .opacity(model.game.player.smallDog ? 1 : 0.25)
                            .font(.largeTitle)
                            .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 0)
                            .animation(.easeInOut(duration: 0.1), value: model.game.player.smallDog)
                    }
                    .frame(width: UIScreen.main.bounds.width / 8, height: 50)
                    .background(!model.game.lowSpec ? .ultraThinMaterial : Material.ultraThick)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .foregroundColor(.white)
                    
                    HStack {
                        Text("🐕‍🦺")
                            .opacity(model.game.player.bigDog ? 1 : 0.2)
                            .font(.largeTitle)
                            .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 0)
                            .animation(.easeInOut(duration: 0.2), value: model.game.player.bigDog)
                    }
                    .frame(width: UIScreen.main.bounds.width / 8, height: 50)
                    .background(!model.game.lowSpec ? .ultraThinMaterial : Material.ultraThick)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .foregroundColor(.white)
                }
            
        }
    }
}

struct PlayerCardsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCardsView()
            .environmentObject(GameModel())
    }
}
