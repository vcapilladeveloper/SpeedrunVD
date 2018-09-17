//
//  Player.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 14/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Player Model. Here we only need the name of the player.
struct Player: Codable {
    let names: Names?
    let name: String?
}
