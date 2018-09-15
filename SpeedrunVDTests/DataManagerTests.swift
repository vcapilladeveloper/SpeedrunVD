//
//  DataManagerTests.swift
//  SpeedrunVDTests
//
//  Created by Victor Capilla Developer on 14/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import SpeedrunVD

class DataManagerTests: XCTestCase {
    
    var sut: DataManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = DataManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDataManager_emptyObjectsAtStart() {
        XCTAssertNil(sut.games)
        XCTAssertNil(sut.runs)
        XCTAssertNil(sut.player)
    }
    
    func testDataManage_getAllData() {
        dataManager_getGames()
        dataManager_getRuns()
        dataManager_getPlayers()
    }
    
    func dataManager_getGames() {
        
        var expectation: XCTestExpectation? = self.expectation(description: "GET GAMES")
        
        sut.getGames { (error) in
            if !error.0 {
                XCTAssertNotNil(self.sut.games)
                expectation?.fulfill()
                expectation = nil
            } else {
                XCTAssertTrue(error.0)
                expectation?.fulfill()
                expectation = nil
            }
        }
        
        self.waitForExpectations(timeout: 10) { (error: Error?) in
            XCTAssertFalse(false, (error?.localizedDescription)!)
        }
    }
    
    func dataManager_getRuns() {
        
        var expectation: XCTestExpectation? = self.expectation(description: "GET RUNS")
        
        guard let g = sut.games else {
            return XCTAssertTrue(false)
        }
        
        sut.getRuns(g[0]) { (error) in
            if !error.0 {
                XCTAssertNotNil(self.sut.runs)
                expectation?.fulfill()
                expectation = nil
            } else {
                XCTAssertTrue(error.0)
                expectation?.fulfill()
                expectation = nil
            }
        }
        
        self.waitForExpectations(timeout: 20) { (error: Error?) in
            XCTAssertFalse(false, (error?.localizedDescription)!)
        }
    }
    
    func dataManager_getPlayers() {
        
        var expectation: XCTestExpectation? = self.expectation(description: "GET PLAYERS")
        guard let r = sut.runs else {
            return XCTAssertTrue(false)
        }
        
        sut.getPlayers(r[0]){ (error) in
            if !error.0 {
                XCTAssertNotNil(self.sut.player)
                expectation?.fulfill()
                expectation = nil
            } else {
                XCTAssertTrue(error.0)
                expectation?.fulfill()
                expectation = nil
            }
            
            self.waitForExpectations(timeout: 20) { (error: Error?) in
                XCTAssertFalse(false, (error?.localizedDescription)!)
            }
        }
    }
}
