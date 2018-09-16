//
//  GameListProviderTests.swift
//  SpeedrunVDTests
//
//  Created by Victor Capilla Developer on 16/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import SpeedrunVD

class GameListProviderTests: XCTestCase {
    
    var sut: GameListProvider!
    var tableView: UITableView!
    var controller: GamesViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GameListProvider()
        sut.dataManager = DataManager()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "GamesViewController") as! GamesViewController
        controller.loadViewIfNeeded()
        tableView = controller.tableView
        tableView.dataSource = sut
        tableView.delegate = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameListProvider_sectionsIsOne() {
        XCTAssertEqual(tableView.numberOfSections, 1)
    }
    
    func testGameListProvider_sectionRowsAreDataProviderGamesCount() {
        guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.game)) else {
            return XCTAssertTrue(false)
        }
        
        let game = result.data[0]
        sut.dataManager?.games.append(game)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        sut.dataManager?.games.append(game)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
        
    }
}
