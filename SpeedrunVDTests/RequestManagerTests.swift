//
//  RequestManagerTests.swift
//  SpeedrunVDTests
//
//  Created by Victor Capilla Developer on 14/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import SpeedrunVD

class RequestManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRequestManager_classExists() {
        // This is an example of a functional test case.
        
        let requestManager = RequestManager()
        
        XCTAssertNotNil(requestManager)
    }
    
    func test_get_request_withIncorectURL() {
        let expectation: XCTestExpectation = self.expectation(description: "GET DATA")
        guard let url = URL(string: "http://www.gogle./") else {
            return XCTAssertTrue(false)
        }
        
        RequestManager.getResults(from: url) { (data, error) in
            if !error.0 {
                XCTAssertNotNil(data)
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
    
    func test_get_request_URLWithoutInfo() {
        
        let expectation: XCTestExpectation = self.expectation(description: "GET DATA")
        guard let url = URL(string: "http://www.speedrun.com/") else {
            return XCTAssertTrue(false)
        }
        RequestManager.getResults(from: url) { (data, error) in
            if !error.0 {
                XCTAssertNotNil(data)
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
