//
//  GameListProvider.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 16/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
import UIKit

protocol GameListDelegate {
    func someError(_ message: String?)
    func openGameInformation(_ game: Game)
    func reloadList()
}

final class GameListProvider: NSObject {
    var dataManager: DataManager?
    var delegate: GameListDelegate?
    
    func getDataForList() {
        dataManager?.getGames({ (error) in
            DispatchQueue.main.async {
                if !error.0 {
                    self.delegate?.reloadList()
                } else {
                    self.delegate?.someError(error.1)
                }
            }
        })
    }
    
}

extension GameListProvider: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager?.countOfGames() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GameItemCell {
            if let game = dataManager?.games[indexPath.row] {
                cell.configCellWithITem(game)
            }
            return cell
        } else {
            return GameItemCell()
        }
        
    }
    
    
}
