//
//  TradeView.swift
//  SuperFarmer
//
//  Created by Dominik Kowalewski on 28/11/2022.
//

import SwiftUI

struct TradeView: View {
    
    @EnvironmentObject var model: GameModel
    @State var bunnyToSheep = false
    @State var sheepToPig = false
    @State var pigToCow = false
    @State var cowToHorse = false
    @State var sheepSmallDog = false
    @State var cowBigDog = false
    @State var reverseSwap = false
    
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            
            HStack {
                Spacer()
                
                Circle()
                    .fill(model.game.lowSpec ? .ultraThickMaterial : .ultraThinMaterial)
                    .frame(width: 48, height: 48)
                    .overlay {
                        Image(systemName: "xmark")
                            .bold()
                            .foregroundColor(.red)
                            .shadow(radius: 5)
                    }
                    .shadow(radius: 10)
                    .onTapGesture {
                        model.game.showTradeView = false
                    }
            }
            .padding(.top, 105)
            .padding(.trailing, 40)
            
            //MARK: Swap Trade Button
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.orange)
                    .frame(width: 45, height: 45)
                    .shadow(radius: 10)
                Image(systemName: "arrow.triangle.2.circlepath")
                    .foregroundColor(.white)
                    .font(.title2)
                    .shadow(radius: 5)
            }
            .rotationEffect(Angle(degrees: reverseSwap ? 0 : 180))
            .animation(.easeInOut, value: reverseSwap)
            .padding(.bottom)
            .onTapGesture {
                reverseSwap.toggle()
            }
            
            
            //MARK: Bunny And Sheep
            
            HStack {
                
                Spacer()
                
                Text("6 🐰")
                    .font(.title)
                    .shadow(radius: 5)
                
                Image(systemName: "arrow.right")
                    .rotationEffect(Angle(degrees: reverseSwap ? -180 : 0))
                    .font(.title)
                    .shadow(radius: 5)
                    .animation(.spring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.5), value: reverseSwap)
                
                Text("1 🐑")
                    .font(.title)
                    .shadow(radius: 5)
                
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
            .foregroundColor(model.game.lowSpec ? .black : .white)
            .background(ZStack {
                if bunnyToSheep {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.green)
                }
                RoundedRectangle(cornerRadius: 20)
                    .fill(model.game.lowSpec ? .ultraThickMaterial : .ultraThinMaterial)
            })
            .shadow(color: bunnyToSheep ? .green : .black.opacity(0.3), radius: bunnyToSheep ? 15 : 7, x: 0, y: 0)
            .animation(.easeInOut, value: bunnyToSheep)
            .onTapGesture {
                model.game.animalToTrade1 = "bunny"
                model.game.animalToTrade2 = "sheep"
                bunnyToSheep.toggle()
                sheepToPig = false
                pigToCow = false
                cowToHorse = false
                sheepSmallDog = false
                cowBigDog = false
            }
            
            //MARK: Sheep And Pig
            
            HStack {
                
                Spacer()
                
                Text("2 🐑")
                    .font(.title)
                    .shadow(radius: 5)
                
                Image(systemName: "arrow.right")
                    .rotationEffect(Angle(degrees: reverseSwap ? -180 : 0))
                    .font(.title)
                    .shadow(radius: 5)
                    .animation(.spring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.5), value: reverseSwap)
                
                Text("1 🐖")
                    .font(.title)
                    .shadow(radius: 5)
                
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
            .foregroundColor(model.game.lowSpec ? .black : .white)
            .background(ZStack {
                if sheepToPig {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.green)
                }
                RoundedRectangle(cornerRadius: 20)
                    .fill(model.game.lowSpec ? .ultraThickMaterial : .ultraThinMaterial)
            })
            .shadow(color: sheepToPig ? .green : .black.opacity(0.3), radius: sheepToPig ? 15 : 7, x: 0, y: 0)
            .animation(.easeInOut, value: sheepToPig)
            .onTapGesture {
                model.game.animalToTrade1 = "sheep"
                model.game.animalToTrade2 = "pig"
                bunnyToSheep = false
                sheepToPig.toggle()
                pigToCow = false
                cowToHorse = false
                sheepSmallDog = false
                cowBigDog = false
            }
            
            //MARK: Pig And Cow
            
            HStack {
                
                Spacer()
                
                Text("3 🐖")
                    .font(.title)
                    .shadow(radius: 5)
                
                Image(systemName: "arrow.right")
                    .rotationEffect(Angle(degrees: reverseSwap ? -180 : 0))
                    .font(.title)
                    .shadow(radius: 5)
                    .animation(.spring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.5), value: reverseSwap)
                
                Text("1 🐄")
                    .font(.title)
                    .shadow(radius: 5)
                
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
            .foregroundColor(model.game.lowSpec ? .black : .white)
            .background(ZStack {
                if pigToCow {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.green)
                }
                RoundedRectangle(cornerRadius: 20)
                    .fill(model.game.lowSpec ? .ultraThickMaterial : .ultraThinMaterial)
            })
            .shadow(color: pigToCow ? .green : .black.opacity(0.3), radius: pigToCow ? 15 : 7, x: 0, y: 0)
            .animation(.easeInOut, value: pigToCow)
            .onTapGesture {
                model.game.animalToTrade1 = "pig"
                model.game.animalToTrade2 = "cow"
                bunnyToSheep = false
                sheepToPig = false
                pigToCow.toggle()
                cowToHorse = false
                sheepSmallDog = false
                cowBigDog = false
            }
            
            //MARK: Cow And Horse
            
            HStack {
                
                Spacer()
                
                Text("2 🐄")
                    .font(.title)
                    .shadow(radius: 5)
                
                Image(systemName: "arrow.right")
                    .rotationEffect(Angle(degrees: reverseSwap ? -180 : 0))
                    .font(.title)
                    .shadow(radius: 5)
                    .animation(.spring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.5), value: reverseSwap)
                
                Text("1 🐎")
                    .font(.title)
                    .shadow(radius: 5)
                
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
            .foregroundColor(model.game.lowSpec ? .black : .white)
            .background(ZStack {
                if cowToHorse {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.green)
                }
                RoundedRectangle(cornerRadius: 20)
                    .fill(model.game.lowSpec ? .ultraThickMaterial : .ultraThinMaterial)
            })
            .shadow(color: cowToHorse ? .green : .black.opacity(0.3), radius: cowToHorse ? 15 : 7, x: 0, y: 0)
            .animation(.easeInOut, value: cowToHorse)
            .onTapGesture {
                model.game.animalToTrade1 = "cow"
                model.game.animalToTrade2 = "horse"
                bunnyToSheep = false
                sheepToPig = false
                pigToCow = false
                cowToHorse.toggle()
                sheepSmallDog = false
                cowBigDog = false
            }
            
            //MARK: Small Dog
            
            HStack {
                
                Spacer()
                
                Text("1 🐑")
                    .font(.title)
                    .shadow(radius: 5)
                
                Image(systemName: "arrow.right")
                    .rotationEffect(Angle(degrees: 0.0))
                    .font(.title)
                    .shadow(radius: 5)
                
                Text("1 🦮")
                    .font(.title)
                    .shadow(radius: 5)
                
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
            .foregroundColor(model.game.lowSpec ? .black : .white)
            .background(ZStack {
                if sheepSmallDog {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.green)
                }
                RoundedRectangle(cornerRadius: 20)
                    .fill(model.game.lowSpec ? .ultraThickMaterial : .ultraThinMaterial)
            })
            .shadow(color: sheepSmallDog ? .green : .black.opacity(0.3), radius: sheepSmallDog ? 15 : 7, x: 0, y: 0)
            .animation(.easeInOut, value: sheepSmallDog)
            .onTapGesture {
                model.game.animalToTrade1 = "sheep"
                model.game.animalToTrade2 = "smallDog"
                bunnyToSheep = false
                sheepToPig = false
                pigToCow = false
                cowToHorse = false
                sheepSmallDog.toggle()
                cowBigDog = false
            }
            
            //MARK: Big Dog
            
            HStack {
                
                Spacer()
                
                Text("1 🐄")
                    .font(.title)
                    .shadow(radius: 5)
                
                Image(systemName: "arrow.right")
                    .rotationEffect(Angle(degrees: 0.0))
                    .font(.title)
                    .shadow(radius: 5)
                
                Text("1 🐕‍🦺")
                    .font(.title)
                    .shadow(radius: 5)
                
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
            .foregroundColor(model.game.lowSpec ? .black : .white)
            .background(ZStack {
                if cowBigDog {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.green)
                }
                RoundedRectangle(cornerRadius: 20)
                    .fill(model.game.lowSpec ? .ultraThickMaterial : .ultraThinMaterial)
            })
            .shadow(color: cowBigDog ? .green : .black.opacity(0.3), radius: cowBigDog ? 15 : 7, x: 0, y: 0)
            .animation(.easeInOut, value: cowBigDog)
            .onTapGesture {
                model.game.animalToTrade1 = "cow"
                model.game.animalToTrade2 = "bigDog"
                bunnyToSheep = false
                sheepToPig = false
                pigToCow = false
                cowToHorse = false
                sheepSmallDog = false
                cowBigDog.toggle()
            }
            
            Button(action: {
                if reverseSwap {
                    if model.game.animalToTrade2 == "smallDog" || model.game.animalToTrade2 == "bigDog" {
                        model.tradeAnimals(name1: model.game.animalToTrade1, name2: model.game.animalToTrade2)
                    } else {
                        model.tradeAnimals(name1: model.game.animalToTrade2, name2: model.game.animalToTrade1)
                    }
                }
                if !reverseSwap {
                    model.tradeAnimals(name1: model.game.animalToTrade1, name2: model.game.animalToTrade2)
                }
            }, label: {
                Text("Confirm")
                    .font(.title2)
                    .bold()
                    .shadow(radius: 5)
                    .frame(width: 150, height: 50)
                    .background((bunnyToSheep || sheepToPig || pigToCow || cowToHorse || sheepSmallDog || cowBigDog) ? .green : .gray)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .foregroundColor(.white)
                    .padding()
                    .animation(.easeInOut, value: (bunnyToSheep || sheepToPig || pigToCow || cowToHorse || sheepSmallDog || cowBigDog))
            })
            .disabled(!(bunnyToSheep || sheepToPig || pigToCow || cowToHorse || sheepSmallDog || cowBigDog))
            
            Spacer()
        }
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView()
    }
}
