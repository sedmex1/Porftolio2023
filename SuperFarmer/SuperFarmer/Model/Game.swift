//
//  Game.swift
//  SuperFarmer
//
//  Created by Dominik Kowalewski on 16/11/2022.
//

import Foundation

struct Game {
    
    var dice1 = "Dice1"
    var dice2 = "Dice2"
    
    var winner = false
    
    var animalToTrade1 = ""
    var animalToTrade2 = ""
    
    var player: Player
    var cards: Cards
    
    var lowSpec = false
    
    var gameRound = 1
    
    var showTradeView = false
}
