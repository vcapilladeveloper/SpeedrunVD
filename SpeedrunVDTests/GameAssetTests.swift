//
//  GameAssetTests.swift
//  SpeedrunVDTests
//
//  Created by Victor Capilla Developer on 14/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import SpeedrunVD


class GameAssetTests: XCTestCase {
    
    var sut: GameAsset?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GameAsset(uri: "http://www.speedrun.com")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGame_ErrorEquals() {
        let testGameAsset = GameAsset(uri: "https://www.speedrun.com")
        XCTAssertNotEqual(testGameAsset, sut)
    }
    
    func testGame_OkEquals() {
        let anotherGameAsset = GameAsset(uri: "http://www.speedrun.com")
    }
}
