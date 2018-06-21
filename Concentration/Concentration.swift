//
//  Concentration.swift
//  Concentration
//
//  Created by Benjamin Lewis on 20/6/18.
//  Copyright © 2018 Benjamin Lewis. All rights reserved.
//

import Foundation

class Concentration {

    var cards = [Card]()

    var indexOfOneAndOnlyFaceUpCard: Int?

    func chooseCard(at index: Int) {
        if cards[index].isMatched { return }

        if indexOfOneAndOnlyFaceUpCard == nil {
            for flipDownIndex in cards.indices {
                cards[flipDownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
            return
        }

        let matchIndex = indexOfOneAndOnlyFaceUpCard!
        if matchIndex == index { return }

        if cards[matchIndex].identifier == cards[index].identifier {
            cards[matchIndex].isMatched = true
            cards[index].isMatched = true
        }
        cards[index].isFaceUp = true
        indexOfOneAndOnlyFaceUpCard = nil
    }

    init(numberOfPairsOfCards: Int) {
        var unshuffled = [Card]()

        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            unshuffled += [card, card]
        }

        for _ in 1...unshuffled.count {
            let rand = Int(arc4random_uniform(UInt32(unshuffled.count)))
            cards.append(unshuffled[rand])
            unshuffled.remove(at: rand)
        }
    }
    
}
