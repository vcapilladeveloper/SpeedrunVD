//
//  GameLink.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 13/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct GameLink: Codable {
    let rel: Related
    let uri: String
}

enum Related: String, Codable {
    case categories = "categories"
    case derivedGames = "derived-games"
    case leaderboard = "leaderboard"
    case levels = "levels"
    case next = "next"
    case records = "records"
    case relSelf = "self"
    case romhacks = "romhacks"
    case runs = "runs"
    case series = "series"
    case variables = "variables"
}
