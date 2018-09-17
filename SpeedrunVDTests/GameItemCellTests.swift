//
//  GameItemCellTests.swift
//  SpeedrunVDTests
//
//  Created by Victor Capilla Studiogenesis on 17/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import XCTest
@testable import SpeedrunVD

class GameItemCellTests: XCTestCase {

    var tableView: UITableView!
    var dataSource = FakeDataSource()
    var cell: GameItemCell!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let controller = UIStoryboard(name: "Main",
                                      bundle: nil).instantiateViewController(withIdentifier: "GamesViewController") as! GamesViewController
        controller.loadViewIfNeeded()
        tableView = controller.tableView
        tableView.dataSource = dataSource
        cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                             for: IndexPath(row: 0, section: 0)) as! GameItemCell
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGameItemCell_HasGameNameLabel() {
        XCTAssertTrue(cell.gameName.isDescendant(of: cell.contentView))
    }

    func testGameItemCell_HasGameLogoImage() {
        XCTAssertTrue(cell.gameLogo.isDescendant(of: cell.contentView))
    }

    func testGameItemCell_HasCorrectName() {
        guard let result: BaseModel<[Game]> = CodableEngine().genericConvert(CodableEngineHelper().getCodableExample(.game)) else {
            return XCTAssertTrue(false)
        }

        let game = result.data[0]
        cell.configCellWithITem(game)
        XCTAssertEqual(cell.gameName.text, game.names.international)
    }
}

extension GameItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
