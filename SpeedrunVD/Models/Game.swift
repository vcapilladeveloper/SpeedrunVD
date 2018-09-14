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
struct Game: Codable {
    let abbreviation: String
    let assets: [String: GameAsset?]
    let links: [GameLink]
    let names: Names
}

struct Names: Codable {
    let international: String
}
