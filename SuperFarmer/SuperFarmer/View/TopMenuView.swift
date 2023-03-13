//
//  TopMenuView.swift
//  SuperFarmer
//
//  Created by Dominik Kowalewski on 30/11/2022.
//

import SwiftUI

struct TopMenuView: View {
    
    @EnvironmentObject var model: GameModel
    
    @State var openned = false
    @State var help = false
    @State var offset: CGFloat = 0
    @State var endingOffset: CGFloat = 0
    @State var startingY: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                
                //MARK: Background
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(model.game.lowSpec ? .ultraThickMaterial : .ultraThinMaterial)
                    .animation(.easeInOut(duration: 0.7), value: openned)
                    .ignoresSafeArea()
                    .frame(width: openned ? UIScreen.main.bounds.width : 45, height: openned ? UIScreen.main.bounds.height : 45)
                    .padding(openned ? 0 : 20)
                    .offset(x: openned ? 0 : -160, y: openned ? 0 : -350)
                
                //MARK: Buttons
                
                VStack (spacing: 20){
                    Text("Continue")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 220, height: 40)
                        .background(.green)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                    
                    Text("Help")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 220, height: 40)
                        .background(.orange)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .onTapGesture {
                            help = true
                        }
                    
                    Toggle("Low Spec Mode", isOn: $model.game.lowSpec)
                        .padding(.horizontal)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 220, height: 40)
                        .background(.orange)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                    
                    Text("Exit")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 220, height: 40)
                        .background(.red)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .onTapGesture {
                            exit(0)
                        }
                }
                .opacity(openned ? 1 : 0)
                .animation(!openned ? .easeInOut(duration: 0.2) : .easeInOut(duration: 0.5).delay(0.2), value: openned)
                
                //MARK: Menu/Close Button
                
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(openned ? .red : model.game.lowSpec ? .black : .white)
                        .frame(width: 30, height: 4)
                        .rotationEffect(Angle(degrees: openned ? -45 : 0))
                        .offset(x: openned ? -1 : 0, y: openned ? 6 : 0)
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(openned ? .red : model.game.lowSpec ? .black : .white)
                        .frame(width: 30, height: 4)
                        .rotationEffect(Angle(degrees: openned ? 45 : 0))
                        .offset(x: openned ? -1 : 0, y: openned ? -6 : 0)
                    
                }
                .shadow(radius: 5)
                .offset(x: openned ? 160 : -160, y: openned ? -400 : -350)
                .animation(.easeInOut(duration: 0.7), value: openned)
                .onTapGesture {
                    help = false
                    openned.toggle()
                }
                
                //MARK: Help Card
                
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height
                               - 90)
                        .ignoresSafeArea()
                        .shadow(radius: 10)
                    VStack (spacing: 10) {
                        Text("Swipe down to close")
                            .foregroundColor(.black)
                            .font(.caption)
                            .offset(y: -40)
                            .padding(.top, 80)
                        
                        Text("How to play?")
                            .font(.title2)
                            .bold()
                        
                        Text("Each round you can roll dices once and trade animals multiple times. If you finish your turn just click Next Round button.")
                            .multilineTextAlignment(.center)
                            .font(.caption)
                        
                        Text("Goal of the game")
                            .font(.title2)
                            .bold()
                        
                        Text("The goal of the game is to have all types of animals at your farm. You can collect them by rolling dices and trading. But be careful, fox 🦊 or wolf 🐺 can eat your animals😱")
                            .multilineTextAlignment(.center)
                            .font(.caption)
                        
                        Text("How to collect animals?")
                            .font(.title2)
                            .bold()
                        
                        Text("Hold more animals to collect them faster. After each roll of the dices you get as many drawn animals as you have pairs of them at your farm and on dices. For examle if you have 3 sheeps 🐑🐑🐑 and you roll a sheep 🐑, you will recieve 2 new sheeps 🐑🐑. Explanation: 🐑🐑🐑 from your farm + 🐑 from dice = 2 pairs in total.")
                            .multilineTextAlignment(.center)
                            .font(.caption)
                        
                        Text("How to protect your animals?")
                            .font(.title2)
                            .bold()
                        
                        Text("Small dog 🦮 will protect your farm from fox 🦊 atack. Big dog 🐕‍🦺 will protect your farm from wolf 🐺. You will see a shield next to your animal, which is protected. After fox or wolf attack, your dog will be automatically taken.")
                            .multilineTextAlignment(.center)
                            .font(.caption)
                        
                        Spacer()
                    }
                    .padding()
                    
                    
                }
                .offset(y: startingY)
                .offset(y: help ? offset-840 : offset)
                .offset(y: endingOffset)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            offset = value.translation.height
                        }
                        .onEnded { value in
                            if offset < 150 {
                                endingOffset -= startingY
                            } else if endingOffset != 0 && offset > 150 {
                                endingOffset = 0
                            }
                            offset = 0
                            help = false
                        })
                .animation(.spring(), value: help)
                
                
            }
        }
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView()
    }
}
