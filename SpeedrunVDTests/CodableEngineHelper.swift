//
//  CodableEngineHelper.swift
//  SpeedrunVDTests
//
//  Created by Victor Capilla Developer on 13/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

final class CodableEngineHelper {
    
    enum TypeOfDataRequested {
        case game, run, player
    }
    
    private let game = "{\"data\":[{\"id\":\"k6qqkx6g\",\"names\":{\"international\":\"! Fishy !\",\"japanese\":null,\"twitch\":\"! Fishy !\"},\"abbreviation\":\"fishy\",\"weblink\":\"https://www.speedrun.com/fishy\",\"released\":2003,\"release-date\":\"2003-02-02\",\"ruleset\":{\"show-milliseconds\":false,\"require-verification\":true,\"require-video\":true,\"run-times\":[\"realtime\"],\"default-time\":\"realtime\",\"emulators-allowed\":false},\"romhack\":false,\"gametypes\":[],\"platforms\":[\"o7e25xew\"],\"regions\":[],\"genres\":[],\"engines\":[\"mg1j4w1r\"],\"developers\":[\"veg7rpe0\"],\"publishers\":[],\"moderators\":{\"mkj9nw84\":\"super-moderator\"},\"created\":\"2016-05-28T23:21:12Z\",\"assets\":{\"logo\":{\"uri\":\"https://www.speedrun.com/themes/fishy/logo.png\",\"width\":180,\"height\":22},\"cover-tiny\":{\"uri\":\"https://www.speedrun.com/themes/fishy/cover-32.png\",\"width\":45,\"height\":32},\"cover-small\":{\"uri\":\"https://www.speedrun.com/themes/fishy/cover-64.png\",\"width\":90,\"height\":64},\"cover-medium\":{\"uri\":\"https://www.speedrun.com/themes/fishy/cover-128.png\",\"width\":180,\"height\":128},\"cover-large\":{\"uri\":\"https://www.speedrun.com/themes/fishy/cover-256.png\",\"width\":360,\"height\":256},\"icon\":{\"uri\":\"https://www.speedrun.com/themes/fishy/favicon.png\",\"width\":32,\"height\":32},\"trophy-1st\":{\"uri\":\"https://www.speedrun.com/themes/fishy/1st.png\",\"width\":16,\"height\":15},\"trophy-2nd\":{\"uri\":\"https://www.speedrun.com/themes/fishy/2nd.png\",\"width\":16,\"height\":15},\"trophy-3rd\":{\"uri\":\"https://www.speedrun.com/themes/fishy/3rd.png\",\"width\":16,\"height\":15},\"trophy-4th\":null,\"background\":{\"uri\":\"https://www.speedrun.com/themes/fishy/background.png\",\"width\":1400,\"height\":998},\"foreground\":{\"uri\":\"https://www.speedrun.com/themes/fishy/foreground.png\",\"width\":200,\"height\":74}},\"links\":[{\"rel\":\"self\",\"uri\":\"https://www.speedrun.com/api/v1/games/k6qqkx6g\"},{\"rel\":\"runs\",\"uri\":\"https://www.speedrun.com/api/v1/runs?game=k6qqkx6g\"},{\"rel\":\"levels\",\"uri\":\"https://www.speedrun.com/api/v1/games/k6qqkx6g/levels\"},{\"rel\":\"categories\",\"uri\":\"https://www.speedrun.com/api/v1/games/k6qqkx6g/categories\"},{\"rel\":\"variables\",\"uri\":\"https://www.speedrun.com/api/v1/games/k6qqkx6g/variables\"},{\"rel\":\"records\",\"uri\":\"https://www.speedrun.com/api/v1/games/k6qqkx6g/records\"},{\"rel\":\"series\",\"uri\":\"https://www.speedrun.com/api/v1/series/yr4gon12\"},{\"rel\":\"derived-games\",\"uri\":\"https://www.speedrun.com/api/v1/games/k6qqkx6g/derived-games\"},{\"rel\":\"romhacks\",\"uri\":\"https://www.speedrun.com/api/v1/games/k6qqkx6g/derived-games\"},{\"rel\":\"leaderboard\",\"uri\":\"https://www.speedrun.com/api/v1/leaderboards/k6qqkx6g/category/rklgq3rd\"}]}]}"
    
    private let run = ""
    
    private let player = ""
    
    private let error = "error"
    
    func returnErrorJson() -> Data {
        return Data(error.utf8)
    }
    
    func getCodableExamole(_ item: TypeOfDataRequested) -> Data {
        switch item {
        case .game:
            return Data(game.utf8)
        case .run:
            return Data(run.utf8)
        case .player:
            return Data(player.utf8)
        }
    }
}
