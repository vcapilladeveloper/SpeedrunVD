//
//  CodableEngineTests.swift
//  SpeedrunVDTests
//
//  Created by Victor Capilla Developer on 13/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import SpeedrunVD

class CodableEngineTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCodableEngine_errorGameResult() {
        guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(CodableEngineHelper().returnErrorJson()) else {
            return XCTAssertTrue(true)
        }
        XCTAssertNil(result)
    }
    
    func testCodableEngine_okGameResult() {
        guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExamole(.game)) else {
            return XCTAssertTrue(false)
        }
    
        let game = result.data[0]
        
        XCTAssert(game is Game)
        let gameAsset = GameAsset(uri: "https://www.speedrun.com/themes/fishy/logo.png")
        let otherGameAsset = GameAsset(uri: "https://www.speedrun.com/themes/fishy/logo.png")
        XCTAssertEqual(game.abbreviation, "fishy")
        XCTAssertEqual(game.names.international, "! Fishy !")
        XCTAssertEqual(game.assets["logo"]!!, gameAsset)
        XCTAssertEqual(gameAsset, otherGameAsset)
        XCTAssertEqual(game.links[0].uri, "https://www.speedrun.com/api/v1/games/k6qqkx6g")
        XCTAssertEqual(game.links[0].rel, .relSelf)
        
        
    }
}
