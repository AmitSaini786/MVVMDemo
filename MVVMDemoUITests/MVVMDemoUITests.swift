//
//  MVVMDemoUITests.swift
//  MVVMDemoUITests
//
//  Created by Amit on 03/03/23.
//

import XCTest

final class MVVMDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
    
        let app = XCUIApplication()
        app.launch()
        
        let title = app.staticTexts["Products"]
        XCTAssertTrue(title.exists , "sdsd")
        let tablesQuery = XCUIApplication().tables
        XCTAssertTrue(tablesQuery.element.exists)
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops").staticTexts["Buy"]/*[[".cells.containing(.staticText, identifier:\"$109.95\")",".buttons[\"Buy\"].staticTexts[\"Buy\"]",".staticTexts[\"Buy\"]",".cells.containing(.staticText, identifier:\"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday\")",".cells.containing(.staticText, identifier:\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops\")"],[[[-1,4,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
