//
//  GameDetailViewController.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Studiogenesis on 17/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
import UIKit
import ToolsVD

// Controller for view that shows the details of game selected from List
class GameDetailViewController: UIViewController {

    var run: Run?
    var player: Player?
    var game: Game?
    var dataManager: DataManager?

    @IBOutlet weak var backgroundImage: URLImageVD!
    @IBOutlet weak var coverGame: URLImageVD!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var timeRun: UILabel!
    @IBAction func openVideo(_ sender: UIButton) {

        guard let url = URL(string: (run?.videos?.links[0].uri) ?? "") else { return }
        guard let appUrl = URL(string: (run?.videos?.links[0].uri.replacingOccurrences(of: "https",
                                                                                       with: "youtube")) ?? "") else {
                                                                                        return
                                                                                        
        }
        let application = UIApplication.shared

        if application.canOpenURL(appUrl) {
            application.open(appUrl)
        } else {
            // if Youtube app is not installed, open URL inside Safari
            application.open(url)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataManager = DataManager()
        getRunAndPlayer()
    }
    
    // Get data and show in the view
    func getRunAndPlayer() {
        pleaseWait()
        if let game = game {
            dataManager?.getRuns(game, { (error) in
                if !error.0 {
                    if let run = self.dataManager?.runs[0] {
                    if let playerUrl = run.players[0].uri {
                        self.run = run
                        self.dataManager?.getPlayers(playerUrl, { (error) in
                            if !error.0 {
                                if let player = self.dataManager?.player {
                                    self.player = player
                                    DispatchQueue.main.async {
                                        self.clearAllNotice()
                                        self.setInfoFromGameAndPlayer()
                                    }
                                }
                            } else {
                                DispatchQueue.main.async {
                                    self.showAlert(error.1)
                                }
                            }
                        })
                    }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.showAlert(error.1)
                    }
                }
            })
        }
    }

    // Set UI elements
    func setInfoFromGameAndPlayer() {
        backgroundImage.setURL(url: NSURL(string: (game?.assets["background"]??.uri) ?? ""), placeholderImage: nil)
        backgroundImage.alpha = 0.7

        coverGame.setURL(url: NSURL(string: (game?.assets["cover-large"]??.uri) ?? ""), placeholderImage: nil)

        gameName.text = game?.names.international ?? "No Game Name"
        playerName.text =  player?.name ?? player?.names?.international ?? "No Player Name"
        timeRun.text = TimeHelperVD().stringFromSecondsInFormat(run?.times.primary_t ?? 0.0)

    }

    private func showAlert(_ message: String? = "Is not possible to load data.") {
        self.clearAllNotice()
        let alert = UIAlertController(title: "Unavailable Data",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        self.present(alert, animated: true)
    }
}
