//
//  GameAsset.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 13/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct GameAsset: Codable, Equatable {
    let uri: String
    
    static func ==(lhs: GameAsset, rhs: GameAsset) -> Bool {
        if lhs.uri != rhs.uri {
            return false
        }
        return true
    }
}
