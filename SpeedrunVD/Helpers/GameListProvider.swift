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
    func startStopLoading()
}

final class GameListProvider: NSObject {
    var dataManager: DataManager?
}

extension GameListProvider: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager?.countOfGames() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
