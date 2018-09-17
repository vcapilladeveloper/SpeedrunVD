//
//  GamesViewController.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 13/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import UIKit

final class GamesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataManager: DataManager?
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate & GameListProvider)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        dataProvider.delegate = self
        self.title = "Games List"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataManager = DataManager()
        dataProvider.dataManager = dataManager
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pleaseWait()
        dataProvider.getDataForList()
    }
}

extension GamesViewController: GameListDelegate {
    func someError(_ message: String?) {
        print("Error")
    }
    
    func openGameInformation(_ game: Game) {
        print("Open Game")
    }
    
    func reloadList() {
        self.clearAllNotice()
        tableView.reloadData()
    }
    
}
