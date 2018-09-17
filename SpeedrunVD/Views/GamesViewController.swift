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
    private var segueToShowDetails = "showGameDetails"
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToShowDetails {
            if let dc = segue.destination as? GameDetailViewController, let game = sender as? Game {
                dc.game = game
            }
        }
    }
    
    private func showAlert(_ message: String? = "Is not possible to load data.") {
        self.clearAllNotice()
        let alert = UIAlertController(title: "Unavailable Data",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

extension GamesViewController: GameListDelegate {
    func someError(_ message: String?) {
        showAlert(message)
    }
    
    func openGameInformation(_ game: Game) {
        performSegue(withIdentifier: segueToShowDetails, sender: game)
    }
    
    func reloadList() {
        self.clearAllNotice()
        tableView.reloadData()
    }
    
}
