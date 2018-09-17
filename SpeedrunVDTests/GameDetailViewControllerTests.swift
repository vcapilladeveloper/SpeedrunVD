//
//  GameDetailViewControllerTests.swift
//  SpeedrunVDTests
//
//  Created by Victor Capilla Studiogenesis on 17/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import SpeedrunVD

class GameDetailViewControllerTests: XCTestCase {
    
    var sut: GameDetailViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameDetailViewController") as! GameDetailViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameDetailViewController_backgroundImageNotNil() {
        XCTAssertNotNil(sut.backgroundImage)
    }
    
    func testGameDetailViewController_coverGameNotNil() {
        XCTAssertNotNil(sut.coverGame)
    }
    
    func testGameDetailViewController_gameNameNotNil() {
        XCTAssertNotNil(sut.gameName)
    }
    
    func testGameDetailViewController_playerNameNotNil() {
        XCTAssertNotNil(sut.playerName)
    }
    
    func testGameDetailViewController_timeRunNotNil() {
        XCTAssertNotNil(sut.timeRun)
    }
    
    
    
}
