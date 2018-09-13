//
//  Game.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 13/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct Game: Codable {
    let abbreviation: String
    let assets: [String: GameAsset?]
    let links: [GameLink]
}
