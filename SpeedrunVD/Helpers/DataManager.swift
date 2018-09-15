//
//  DataManager.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 14/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Manager to make all calls to the RequestManager
// to get and manage information
final class DataManager: NSObject {
    
    let requestDomain = "https://www.speedrun.com/api/v1/"
    
    var games: [Game]?
    var runs: [Run]?
    var player: Player?
    
    func getGames(_ completionHandler: @escaping (_ error: (Bool, String?))->Void) {
        guard let url = URL(string: requestDomain + "games") else {
                return completionHandler((true, nil))
        }
        
        RequestManager.getResults(url) { (data, error) in
            if !error.0 {
                guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(data) else {
                    return completionHandler((true, nil))
                }
                self.games = result.data
                completionHandler((false, nil))
            } else {
                completionHandler((true, error.1))
            }
        }
    }
    
}
