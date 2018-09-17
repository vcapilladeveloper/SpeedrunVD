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
    
    var games = [Game]()
    var runs = [Run]()
    var player: Player?
    
    func countOfGames() -> Int {
        return games.count 
    }
    
    func getGameFrom(position: Int) -> Game {
        return games[position] 
    }
    
    func getGames(_ completionHandler: @escaping (_ error: (Bool, String?))->Void) {
        guard let url = URL(string: requestDomain + "games") else {
                return completionHandler((true, nil))
        }
        
        RequestManager.getResults(from: url) { (data, error) in
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
    
    func getRuns(_ game: Game, _ completionHandler: @escaping (_ error: (Bool, String?))->Void){
        
        if let runsUrl = game.links.filter({$0.rel == .runs}).first {
            guard let url = URL(string: runsUrl.uri) else {
                return completionHandler((true, nil))
            }
            
            RequestManager.getResults(from: url) { (data, error) in
                if !error.0 {

                    guard let result: BaseModel<[Run]> = CodableEngine().genericConvert(data) else {
                        return completionHandler((true, nil))
                    }
                    self.runs = result.data
                    completionHandler((false, nil))
                } else {
                    completionHandler((true, error.1))
                }
            }
        }
    }
    
    func getPlayers(_ playerUrl: String, _ completionHandler: @escaping (_ error: (Bool, String?)) -> Void) {
        
        guard let url = URL(string: playerUrl) else {
            return completionHandler((true, nil))
        }
        
        RequestManager.getResults(from: url) { (data, error) in
            if !error.0 {
                guard let result: BaseModel<Player> = CodableEngine().genericConvert(data) else {
                    return completionHandler((true, nil))
                }
                self.player = result.data
                completionHandler((false, nil))
            } else {
                completionHandler((true, error.1))
            }
        }
    }
}
