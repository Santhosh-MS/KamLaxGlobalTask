//
//  RootViewControllerTest.swift
//  KamLaxTaskTests
//
//  Created by Ducont on 23/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import XCTest
import UIKit
@testable import KamLaxTask
class RootViewControllerTest: XCTestCase {
    var RootViewCtrl : ViewControllerRoot!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func test_ViewTtitleTest(){
        XCTAssert(RootViewCtrl.navigationItem.title == "NYT","Contact Not Yet Found")
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
