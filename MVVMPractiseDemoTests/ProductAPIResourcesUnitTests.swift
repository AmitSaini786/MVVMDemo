//
//  ProductAPIResourcesUnitTests.swift
//  MVVMDemoTests
//
//  Created by Amit on 19/02/23.
//

import XCTest
import Foundation
@testable import MVVMDemo

final class ProductAPIResourcesUnitTests: XCTestCase {

    func test_ProductApi_Response(){
        let expectation = self.expectation(description: "ValidRequest_Returns_ProductResponse")
        APIManager.shared.request(
            modelType: [Product].self, type: APIEndPoint.products) { response in               // ASSERT
               XCTAssertNotNil(response)
               expectation.fulfill()
           }
        waitForExpectations(timeout: 3, handler: nil)
       }
    
    func testCheckInternetConnectivity(){
        let internetConnectivity =  InternetAvaiable()
        let status = internetConnectivity.isInternetAvailable()
        XCTAssertNotNil(status)
        XCTAssertEqual(status, true)
    }
    
    
 

}
