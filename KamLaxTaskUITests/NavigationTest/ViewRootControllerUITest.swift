//
//  ViewRootControllerUITest.swift
//  KamLaxTaskUITests
//
//  Created by Ducont on 23/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import XCTest

class ViewRootControllerUITest: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
       app = XCUIApplication()
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testContactListNavigation() {
        let contactNavigationBar = app.navigationBars["NYT"]
        XCTAssertTrue(contactNavigationBar.exists, "Contact list navigation bar not exist.")
        
        let groupButton = contactNavigationBar.buttons["Groups"]
        XCTAssertTrue(groupButton.exists, "Group button not exists in contact list navigation bar.")
        
        let addButton = contactNavigationBar.buttons["Add"]
        XCTAssertTrue(addButton.exists, "Group button not exists in contact list navigation bar.")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
