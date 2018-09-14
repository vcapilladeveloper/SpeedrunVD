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
        guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.game)) else {
            return XCTAssertTrue(false)
        }
    
        let game = result.data[0]

        let gameAsset = GameAsset(uri: "https://www.speedrun.com/themes/fishy/logo.png")
        let otherGameAsset = GameAsset(uri: "https://www.speedrun.com/themes/fishy/logo.png")
        XCTAssertEqual(game.abbreviation, "fishy")
        XCTAssertEqual(game.names.international, "! Fishy !")
        XCTAssertEqual(game.assets["logo"]!!, gameAsset)
        XCTAssertEqual(gameAsset, otherGameAsset)
        XCTAssertEqual(game.links[0].uri, "https://www.speedrun.com/api/v1/games/k6qqkx6g")
        XCTAssertEqual(game.links[0].rel, .relSelf)
        
    }
    
    func testCodableEngine_errorRunResult() {
        guard let result: BaseModel<[Run]> = CodableEngine().genericConvert(CodableEngineHelper().returnErrorJson()) else {
            return XCTAssertTrue(true)
        }
        XCTAssertNil(result)
    }
    
    func testCodableEngine_okRunResult() {
        guard let result: BaseModel<[Run]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.run)) else {
            return XCTAssertTrue(false)
        }
        
        let run = result.data[0]

        //XCTAssertEqual(run.times.primary_t, 435)
        XCTAssertEqual(run.players[0].uri, "https://www.speedrun.com/api/v1/users/mkj9nw84")
        //XCTAssertEqual(run.videos.links[0].uri, "https://youtu.be/-Vesbd8uJzE")
    }
    
    func testCodableEngine_errorPlayerResult() {
        guard let result: BaseModel<[Player]> = CodableEngine().genericConvert(CodableEngineHelper().returnErrorJson()) else {
            return XCTAssertTrue(true)
        }
        XCTAssertNil(result)
    }
    
    func testCodableEngine_okPlayerResult() {
        guard let result: BaseModel<Player> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.player)) else {
            return XCTAssertTrue(false)
        }
        
        let player = result.data
        
        XCTAssertEqual(player.names.international, "f1")
    }
}
