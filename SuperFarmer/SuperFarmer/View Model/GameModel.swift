//
//  GameModel.swift
//  SuperFarmer
//
//  Created by Dominik Kowalewski on 16/11/2022.
//

import Foundation

class GameModel: ObservableObject {
    
    @Published var game = Game(player: Player(winner: false, bunny: 1, sheep: 0, pig: 0, cow: 0, horse: 0, smallDog: false, bigDog: false), cards: Cards(bunny: 59, sheep: 24, pig: 16, cow: 12, horse: 4, smallDog: 4, bigDog: 2))
    
    func nextRound() {
        game.gameRound += 1
    }
    
    func rollDice() {
        
        // Array to select random animal
        let dice1 = ["bunny", "bunny", "bunny", "bunny", "bunny", "sheep", "sheep", "sheep", "pig", "pig", "cow", "fox"]
        let dice2 = ["bunny", "bunny", "bunny", "bunny", "bunny", "sheep", "sheep", "sheep", "pig", "pig", "horse", "wolf"]
        
        self.game.dice1 = dice1.randomElement()!
        self.game.dice2 = dice2.randomElement()!
        
        let random1 = game.dice1
        let random2 = game.dice2
        
        // Check if we remove cards or add cards
        if (random2 == "wolf") {
            if self.game.player.bigDog == true {
                self.game.player.bigDog = false
            } else {
                self.game.player.sheep = 0
                self.game.player.pig = 0
                self.game.player.cow = 0
            }
        } else if (random1 == "fox") {
            if self.game.player.smallDog == true {
                game.player.smallDog = false
            } else {
                self.game.cards.bunny += self.game.player.bunny
                self.game.player.bunny = 0
            }
        } else {
            addCardsToPlayer(a1: random1, a2: random2)
        }
    }
    
    func addCardsToPlayer(a1: String, a2: String) {
        
        if a1 == a2 {
            
            if pairs(animal: a1) == 0 {
                switch(a1) {
                case "bunny" :
                    if self.game.cards.bunny >= 1 {
                        self.game.player.bunny += 1
                        self.game.cards.bunny -= 1
                    }
                    break
                case "sheep":
                    if self.game.cards.sheep >= 1 {
                        self.game.player.sheep += 1
                        self.game.cards.sheep -= 1
                    }
                    break
                case "pig" :
                    if self.game.cards.pig >= 1 {
                        self.game.player.pig += 1
                        self.game.cards.pig -= 1
                    }
                    break
                case "cow" :
                    if self.game.cards.cow >= 1 {
                        self.game.player.pig += 1
                        self.game.cards.pig -= 1
                    }
                    break
                case "horse" :
                    if self.game.cards.horse >= 1 {
                        self.game.player.horse += 1
                        self.game.cards.horse -= 1
                    }
                    break
                default:
                    break
                }
            } else if pairs(animal: a1) > 0 {
                switch(a1) {
                case "bunny" :
                    let pairs = pairs(animal: a1)
                    if self.game.cards.bunny <= pairs {
                        self.game.player.bunny += self.game.cards.bunny
                        self.game.cards.bunny = 0
                    } else {
                        self.game.player.bunny += (pairs+1)
                        self.game.cards.bunny -= (pairs+1)
                    }
                    break
                case "sheep":
                    let pairs = pairs(animal: a1)
                    if self.game.cards.sheep < pairs {
                        self.game.player.sheep += self.game.cards.sheep
                        self.game.cards.sheep = 0
                    }
                    if self.game.cards.sheep > pairs {
                        self.game.player.sheep += (pairs+1)
                        self.game.cards.sheep -= (pairs+1)
                    }
                    break
                case "pig" :
                    let pairs = pairs(animal: a1)
                    if self.game.cards.pig < pairs {
                        self.game.player.pig += self.game.cards.pig
                        self.game.cards.pig = 0
                    }
                    if self.game.cards.pig > pairs {
                        self.game.player.pig += (pairs+1)
                        self.game.cards.pig -= (pairs+1)
                    }
                    break
                case "cow" :
                    let pairs = pairs(animal: a1)
                    if self.game.cards.cow < pairs {
                        self.game.player.cow += self.game.cards.cow
                        self.game.cards.cow = 0
                    }
                    if self.game.cards.cow > pairs {
                        self.game.player.cow += (pairs+1)
                        self.game.cards.cow -= (pairs+1)
                    }
                    break
                case "horse" :
                    let pairs = pairs(animal: a1)
                    if self.game.cards.horse < pairs {
                        self.game.player.horse += self.game.cards.horse
                        self.game.cards.horse = 0
                    }
                    if self.game.cards.horse > pairs {
                        self.game.player.horse += (pairs+1)
                        self.game.cards.horse -= (pairs+1)
                    }
                    break
                default:
                    break
                }
            }
        } else if a1 != a2 {
            if pairs(animal: a1) != 0 {
                
                switch(a1) {
                case "bunny" :
                    let pairs = pairs(animal: a1)
                    if self.game.cards.bunny < pairs {
                        self.game.player.bunny += self.game.cards.bunny
                        self.game.cards.bunny = 0
                    }
                    if self.game.cards.bunny > pairs {
                        self.game.player.bunny += pairs
                        self.game.cards.bunny -= pairs
                    }
                    break
                case "sheep":
                    let pairs = pairs(animal: a1)
                    if self.game.cards.sheep < pairs {
                        self.game.player.sheep += self.game.cards.sheep
                        self.game.cards.sheep = 0
                    }
                    if self.game.cards.sheep > pairs {
                        self.game.player.sheep += pairs
                        self.game.cards.sheep -= pairs
                    }
                    break
                case "pig" :
                    let pairs = pairs(animal: a1)
                    if self.game.cards.pig < pairs {
                        self.game.player.pig += self.game.cards.pig
                        self.game.cards.pig = 0
                    }
                    if self.game.cards.pig > pairs {
                        self.game.player.pig += pairs
                        self.game.cards.pig -= pairs
                    }
                    break
                case "cow" :
                    let pairs = pairs(animal: a1)
                    if self.game.cards.cow < pairs {
                        self.game.player.cow += self.game.cards.cow
                        self.game.cards.cow = 0
                    }
                    if self.game.cards.cow > pairs {
                        self.game.player.cow += pairs
                        self.game.cards.cow -= pairs
                    }
                    break
                case "horse" :
                    let pairs = pairs(animal: a1)
                    if self.game.cards.horse < pairs {
                        self.game.player.horse += self.game.cards.horse
                        self.game.cards.horse = 0
                    }
                    if self.game.cards.horse > pairs {
                        self.game.player.horse += pairs
                        self.game.cards.horse -= pairs
                    }
                    break
                default:
                    break
                }
            }
            if pairs(animal: a2) != 0 {
                
                switch(a2) {
                case "bunny" :
                    let pairs = pairs(animal: a2)
                    if self.game.cards.bunny < pairs {
                        self.game.player.bunny += self.game.cards.bunny
                        self.game.cards.bunny = 0
                    }
                    if self.game.cards.bunny > pairs {
                        self.game.player.bunny += pairs
                        self.game.cards.bunny -= pairs
                    }
                    break
                case "sheep":
                    let pairs = pairs(animal: a2)
                    if self.game.cards.sheep < pairs {
                        self.game.player.sheep += self.game.cards.sheep
                        self.game.cards.sheep = 0
                    }
                    if self.game.cards.sheep > pairs {
                        self.game.player.sheep += pairs
                        self.game.cards.sheep -= pairs
                    }
                    break
                case "pig" :
                    let pairs = pairs(animal: a2)
                    if self.game.cards.pig < pairs {
                        self.game.player.pig += self.game.cards.pig
                        self.game.cards.pig = 0
                    }
                    if self.game.cards.pig > pairs {
                        self.game.player.pig += pairs
                        self.game.cards.pig -= pairs
                    }
                    break
                case "cow" :
                    let pairs = pairs(animal: a2)
                    if self.game.cards.cow < pairs {
                        self.game.player.cow += self.game.cards.cow
                        self.game.cards.cow = 0
                    }
                    if self.game.cards.cow > pairs {
                        self.game.player.cow += pairs
                        self.game.cards.cow -= pairs
                    }
                    break
                case "horse" :
                    let pairs = pairs(animal: a2)
                    if self.game.cards.horse < pairs {
                        self.game.player.horse += self.game.cards.horse
                        self.game.cards.horse = 0
                    }
                    if self.game.cards.horse > pairs {
                        self.game.player.horse += pairs
                        self.game.cards.horse -= pairs
                    }
                    break
                default:
                    break
                }
            }
        }
    }
    
    func tradeAnimals(name1: String,name2: String) {
        
        //MARK: One To Many
        
        if(name1 == "bunny" && name2 == "sheep") {
            if self.game.player.bunny >= 6  && self.game.cards.sheep >= 1 {
                self.game.player.bunny -= 6
                self.game.cards.bunny += 6
                self.game.player.sheep += 1
                self.game.cards.sheep -= 1
            }
        }
        
        else if(name1 == "sheep" && name2 == "pig") {
            if self.game.player.sheep >= 2 && self.game.cards.pig >= 1 {
                self.game.player.sheep -= 2
                self.game.cards.sheep += 2
                self.game.player.pig += 1
                self.game.cards.pig -= 1
            }
        }
        
        else if(name1 == "pig" && name2 == "cow") {
            if self.game.player.pig >= 3 && self.game.cards.cow >= 1 {
                self.game.player.pig -= 3
                self.game.cards.pig += 3
                self.game.player.cow += 1
                self.game.cards.cow -= 1
            }
        }
        
        else if(name1 == "cow" && name2 == "horse") {
            if self.game.player.cow >= 2 && self.game.cards.horse >= 1 {
                self.game.player.cow -= 2
                self.game.cards.cow += 2
                self.game.player.horse += 1
                self.game.cards.horse -= 1
            }
        }
        
        else if(name1 == "sheep" && name2 == "smallDog") {
            if self.game.player.sheep >= 1 && self.game.cards.smallDog >= 1 {
                self.game.player.sheep -= 1
                self.game.cards.sheep += 1
                self.game.player.smallDog = true
                self.game.cards.smallDog -= 1
            }
        }
        
        else if(name1 == "cow" && name2 == "bigDog") {
            if self.game.player.cow >= 1 && self.game.cards.bigDog >= 1 {
                self.game.player.cow -= 1
                self.game.cards.cow += 1
                self.game.player.bigDog = true
                self.game.cards.bigDog -= 1
            }
        }
        
        //MARK: Many To One
        
        else if(name1 == "sheep" && name2 == "bunny") {
            if self.game.player.sheep >= 1 && self.game.cards.bunny >= 6 {
                self.game.player.sheep -= 1
                self.game.cards.sheep += 1
                self.game.player.bunny += 6
                self.game.cards.bunny -= 6
            }
        }
        
        else if(name1 == "pig" && name2 == "sheep") {
            if self.game.player.pig >= 1 && self.game.cards.sheep >= 2 {
                self.game.player.sheep += 2
                self.game.cards.sheep -= 2
                self.game.player.pig -= 1
                self.game.cards.pig += 1
            }
        }
        
        else if(name1 == "cow" && name2 == "pig") {
            if self.game.player.cow >= 1 && self.game.cards.pig >= 3 {
                self.game.player.pig += 3
                self.game.cards.pig -= 3
                self.game.player.cow -= 1
                self.game.cards.cow += 1
            }
        }
        
        else if(name1 == "horse" && name2 == "cow") {
            if self.game.player.horse >= 1  && self.game.cards.cow >= 2{
                self.game.player.cow += 2
                self.game.cards.cow -= 2
                self.game.player.horse -= 1
                self.game.cards.horse += 1
            }
        }
    }
    
    func pairs(animal: String) -> Int {
        
        var pairs = 0
        
        switch(animal) {
            // +1 because we check only when random animal is already choosen for player so we need to add one from dice
        case "bunny" :
            pairs = (self.game.player.bunny + 1) / 2
            break
        case "sheep":
            pairs = (self.game.player.sheep + 1) / 2
            break
        case "pig" :
            pairs = (self.game.player.pig + 1) / 2
            break
        case "cow" :
            pairs = (self.game.player.cow + 1) / 2
            break
        case "horse" :
            pairs = (self.game.player.horse + 1) / 2
            break
        default:
            break
        }
        
        return pairs
    }
    
    func playerWinner() -> Bool {
        if game.player.bunny != 0 && game.player.sheep != 0 && game.player.pig != 0 && game.player.cow != 0 && game.player.horse != 0 {
            return true
        } else {
            return false
        }
    }
    
    func winner() {
        if playerWinner() == true {
            game.winner = true
        }
    }
    
}
