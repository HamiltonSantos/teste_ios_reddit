//
//  Fast_NewsTests.swift
//  Fast NewsTests
//
//  Created by Lucas Moreton on 16/09/19.
//  Copyright © 2019 Lucas Moreton. All rights reserved.
//

import XCTest
@testable import Fast_News

class Fast_NewsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        HotNewsProvider.shared.resetPagination()
    }
    
    func testHotNewsFirstPage() {
        let promise =  expectation(description: "first page loaded successfully")
        HotNewsProvider.shared.hotNews { (completion) in
            do {
                let hotNews = try completion()
                if hotNews.count > 0 {
                    promise.fulfill()
                } else {
                    XCTFail("first page empty")
                }
            } catch {
                XCTFail("first page not loaded")
            }
        }
        
        wait(for: [promise], timeout: 5)
    }
    
    func testHotNewsComentsFirstPage() {
        let promise = expectation(description: "first comments page loaded successfully")
        HotNewsProvider.shared.hotNews { (completion) in
            do {
                guard let firstNewsId = try completion()[0].id else {
                    XCTFail("first news not loaded")
                    return
                }
                HotNewsProvider.shared.hotNewsComments(id: firstNewsId) { (completion) in
                    do {
                        let _ = try completion()
                        promise.fulfill()
                    } catch {
                        XCTFail("comments not loaded")
                    }
                }
            } catch {
                XCTFail("first news not loaded")
            }
        }
        
        wait(for: [promise], timeout: 5)
    }
    
}
