//
//  MainView.swift
//  SuperFarmer
//
//  Created by Dominik Kowalewski on 14/11/2022.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var model: GameModel
    
    var image1: String = ""
    @State var tradeAnimal1 = "sheep"
    @State var tradeAnimal2 = "pig"
    @State var buttonBunnyToSheep = false
    @State var rollButton = true
    @State var tradeButton = false
    @State var showTradeView = true
    
    var body: some View {
        ZStack {
            
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            
            //MARK: Round
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    Text("Round \(model.game.gameRound)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(model.game.lowSpec ? .black : .white)
                        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(model.game.lowSpec ? .ultraThickMaterial : .ultraThinMaterial)
                            .frame(width:100, height: 40))
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 0)
                    .padding(.top, 180)
                    
                    Spacer()
                }
                
                Spacer()
                
                //MARK: Dices
                
                DicesView()
                
                //MARK: Buttons Section
                
                HStack (spacing: 15) {
                    Button {
                        model.game.showTradeView = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(!tradeButton ? .blue.opacity(0.8) : .blue)
                                .frame(width: UIScreen.main.bounds.width / 4, height: 50)
                                .shadow(radius: 10)
                                .animation(.easeInOut, value: tradeButton)
                            
                            Text("Trade")
                                .font(.title3)
                                .bold()
                                .foregroundColor(!tradeButton ? .white.opacity(0.8) : .white)
                                .shadow(radius: 5)
                        }
                    }
                    .disabled(!tradeButton)
                    
                    Button {
                        model.rollDice()
                        tradeButton = true
                        rollButton = false
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(!rollButton ? .green.opacity(0.8) : .green)
                                .frame(width: UIScreen.main.bounds.width / 4, height: 50)
                                .shadow(radius: 10)
                                .animation(.easeInOut, value: rollButton)
                            
                            Text("Roll!")
                                .font(.title3)
                                .bold()
                                .foregroundColor(!rollButton ? .white.opacity(0.8) : .white)
                                .shadow(radius: 5)
                        }
                    }
                    .disabled(!rollButton)
                    
                    Button {
                        model.nextRound()
                        rollButton = true
                        tradeButton = false
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(rollButton ? .orange.opacity(0.8) : .orange)
                                .frame(width: UIScreen.main.bounds.width / 3, height: 50)
                                .shadow(radius: 10)
                            
                            Text("Next Round")
                                .font(.title3)
                                .bold()
                                .foregroundColor(rollButton ? .white.opacity(0.8) : .white)
                                .shadow(radius: 5)
                        }
                    }
                    .disabled(rollButton)
                    
                }
                .padding(.vertical, 30)
                
                //MARK: Player Cards
                
                PlayerCardsView()
                
                
            }
            
            //MARK: Trade View
            
            .overlay(content: {
                if model.game.showTradeView {
                    TradeView()
                        .offset(y: -75)
                        .background(
                            Color.black.opacity(0.2)
                        )
                        .onTapGesture {
                            model.game.showTradeView = false
                            
                        }
                }
            })
            .animation(.easeInOut(duration: 0.2), value: model.game.showTradeView)
            
            //MARK: Top Bar - Menu and Rounds
            HStack (alignment: .top){
                TopMenuView()
                    .padding(.horizontal, 20)
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(GameModel())
    }
}
