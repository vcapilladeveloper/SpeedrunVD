//
//  Run.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 14/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

struct Run: Codable {
    let players: [PlayerLink]
    let videos: Videos
    let times: PlayerTime
}

struct PlayerLink: Codable {
    let rel, id: String
    let uri: String
}

struct PlayerTime: Codable {
    let primary_t: Int
}

struct Videos: Codable {
    let links: [VideoLinks]
}

struct VideoLinks: Codable {
    let uri: String
}
