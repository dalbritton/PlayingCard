//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by davida on 1/11/19.
//  Copyright © 2019 davida. All rights reserved.
//

import Foundation

struct PlayingCard {
    var suit: Suit
    var rank: Rank
    
    enum Suit: String {
        case spades = "♠️"
        case clubs = "♣️"
        case hearts = "♥️"
        case diamonds = "♦️"
    }
    
    static var all: [Suit] {
        return [ .spades, .clubs, .hearts, .diamonds]
    }
    
    enum Rank {
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(.numeric(pips))
            }
            allRanks += [ .face("J"), .face("Q"), .face("K")]
            return allRanks
        }
    }
}
