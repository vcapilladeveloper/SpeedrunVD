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
    
    func testGameListProvider_returnGameItemCell() {
        guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.game)) else {
            return XCTAssertTrue(false)
        }
        
        let game = result.data[0]
        sut.dataManager?.games.append(game)
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is GameItemCell)
    }
    
    func testGameListProvider_DequeueCell() {
        let mockTableView = MockTableView.mockTableViewWithDataSource(sut)
        guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.game)) else {
            return XCTAssertTrue(false)
        }
        
        let game = result.data[0]
        sut.dataManager?.games.append(game)
        mockTableView.reloadData()
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func testGameListProvider_getConfiguredWithItem() {
        let mockTableView = MockTableView.mockTableViewWithDataSource(sut)
        guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.game)) else {
            return XCTAssertTrue(false)
        }
        
        let game = result.data[0]
        sut.dataManager?.games.append(game)
        sut.dataManager?.games.append(game)
        mockTableView.reloadData()
        guard let cell = mockTableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? MockGameItemCell else {
            return XCTAssertTrue(false)
        }
        
        if let item = cell.itemCell {
            XCTAssertEqual(item, game)
        } else {
            XCTAssertTrue(false)
        }
        
    }
}

extension GameListProviderTests {
    class MockTableView: UITableView {
        var cellGotDequeued = false
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        class func mockTableViewWithDataSource(_ dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480), style: .plain)
            mockTableView.dataSource = dataSource
            
            mockTableView.register(MockGameItemCell.self, forCellReuseIdentifier: "cell")
            
            return mockTableView
            
        }
    }
        
        class MockGameItemCell: GameItemCell {
            var itemCell: Game?
            
            override func configCellWithITem(_ item: Game) {
                itemCell = item
            }
            
        }
    }
