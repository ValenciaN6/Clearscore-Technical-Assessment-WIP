//
//  DashboardViewModelTests.swift
//  clearscoreProjectTests
//
//  Created by Valencia Magagane on 2021/11/24.
//

import XCTest
import Cuckoo

@testable import clearscoreProject

class DashboardViewModelTests: XCTestCase {
    var serviceUnderTest: DashboardViewModel!
    var mockView = MockDashboardView()
    
    override func setUp() {
         super.setUp()
        // serviceUnderTest = DashboardViewModel(view: mockView)
    }
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
