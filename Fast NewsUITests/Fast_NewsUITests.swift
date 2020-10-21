//
//  Fast_NewsUITests.swift
//  Fast NewsUITests
//
//  Created by Lucas Moreton on 16/09/19.
//  Copyright © 2019 Lucas Moreton. All rights reserved.
//

import XCTest

class Fast_NewsUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFeed() {
        sleep(2)
        let tableView = app.tables.element
        guard let lastCell = tableView.cells.allElementsBoundByIndex.last else { return }
        let MAX_SCROLLS = 3
        var count = 0
        while !lastCell.isHittable && count < MAX_SCROLLS {
            tableView.swipeUp()
            count += 1
            sleep(1)
        }
        let newLastCell = tableView.cells.allElementsBoundByIndex.last
        XCTAssertNotEqual(lastCell, newLastCell, "new page not loaded")
    }
    
    func testShowNewsDetail() {
        
        let commentCell = app.cells["CommentCell"]
        
        let tables = app.tables
        tables.cells.element(boundBy: 0).tap()
        XCTAssert(commentCell.exists)
    }
    
}
