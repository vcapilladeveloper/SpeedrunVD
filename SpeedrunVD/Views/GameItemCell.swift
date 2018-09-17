//
//  GameItemCell.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Studiogenesis on 17/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import UIKit
import ToolsVD

// Cell for show details of games in tableView
class GameItemCell: UITableViewCell {
    
    @IBOutlet weak var gameLogo: URLImageVD!
    @IBOutlet weak var gameName: UILabel!
    
    func configCellWithITem(_ item: Game) {
        gameLogo.setURL(url: NSURL(string: (item.assets["cover-small"]??.uri) ?? ""), placeholderImage: #imageLiteral(resourceName: "emptyGame"))
        gameName.text = item.names.international
    
    }
    
}
