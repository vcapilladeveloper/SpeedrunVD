//
//  GamesViewControllerTest.swift
//  SpeedrunVDTests
//
//  Created by Victor Capilla Developer on 16/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import SpeedrunVD

class GamesViewControllerTest: XCTestCase {
    
    var sut: GamesViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "GamesViewController") as! GamesViewController
        sut.loadViewIfNeeded()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGamesViewController_tableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testGamesViewController_shouldSetTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is GameListProvider)
    }
    
    func testGamesViewController_shouldSetTableViewDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is GameListProvider)
    }
    
    func testGamesViewController_dataSourceAndDelegateBeTheSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? GameListProvider, sut.tableView.delegate as? GameListProvider)
    }
    
    func testGamesViewController_dataManagerBeTheSameAsGameListProviderDataManager() {
        XCTAssertEqual(sut.dataManager, (sut.tableView.delegate as? GameListProvider)?.dataManager)
    }
    
}
