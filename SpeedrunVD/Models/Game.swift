//
//  Game.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 13/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Game Model. From game we only need Abbreviation and
// Names to show in the view, assets to get Logo
// and links to get runs
struct Game: Codable, Equatable {
    // I know that this is not the best equatable function of the world,
    // but I don't have enouth time to make each Model Equatable
    static func == (lhs: Game, rhs: Game) -> Bool {
        if lhs.abbreviation != rhs.abbreviation {
            return false
        }
        
        if lhs.assets.count != rhs.assets.count {
            return false
        }
        
        if lhs.links.count != rhs.links.count {
            return false
        }
        
        if lhs.names.international != rhs.names.international {
            return false
        }
        
        return true
    }
    
    let abbreviation: String
    let assets: [String: GameAsset?]
    let links: [GameLink]
    let names: Names
}

struct Names: Codable {
    let international: String
}
