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

    func testGameDetailViewController_gameNameNotNil() {
        XCTAssertNotNil(sut.gameName)
    }
    
    func testGameDetailViewController_playerNameNotNil() {
        XCTAssertNotNil(sut.playerName)
    }
    
    func testGameDetailViewController_timeRunNotNil() {
        XCTAssertNotNil(sut.timeRun)
    }
    
    func testGameDetailViewController_AfterGetInformation() {
        guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.game)) else {
            return XCTAssertTrue(false)
        }
        
        sut.game = result.data[0]
        guard let runResult: BaseModel<[Run]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.run)) else {
            return XCTAssertTrue(false)
        }
        
        sut.run = runResult.data[0]
        
        guard let playerResult: BaseModel<Player> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.player)) else {
            return XCTAssertTrue(false)
        }
        
        sut.player = playerResult.data
        
        sut.setInfoFromGameAndPlayer()
        
        XCTAssertEqual(sut.backgroundImage.url?.absoluteString, sut.game?.assets["background"]??.uri)
        XCTAssertEqual(sut.coverGame.url?.absoluteString, sut.game?.assets["cover-large"]??.uri)
        XCTAssertEqual(sut.gameName.text, sut.game?.names.international)
        XCTAssertEqual(sut.playerName.text, sut.player?.name ?? sut.player?.names?.international)
        
    }
    
}
