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
    
    func testDataManager_getGames() {
        
        let expectation: XCTestExpectation = self.expectation(description: "GET DATA")
        
        sut.getGames { (error) in
            if !error.0 {
                XCTAssertNotNil(self.sut.games)
                expectation.fulfill()
            } else {
                XCTAssertTrue(error.0)
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 10) { (error: Error?) in
            XCTAssertFalse(false, (error?.localizedDescription)!)
        }
    }
    
}
