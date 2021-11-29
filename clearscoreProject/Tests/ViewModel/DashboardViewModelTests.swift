//
//  DashboardViewModelTests.swift
//  clearscoreProjectTests
//
//  Created by Valencia Magagane on 2021/11/23.
//

import XCTest
@testable import clearscoreProject


class DashboardViewModelTests: XCTestCase {

    let mockView = MockDashboardView()
    var serviceUnderTest: DashboardViewModel!
    var mockClearscoreRepository = MockClearscoreRepository()
    var mockClearscoreData = MockClearscoreData()
    
    override func setUp() {
        super.setUp()
        
        registerDependency()
        
        serviceUnderTest = DashboardViewModel(view: mockView, clearscoreRepository: mockClearscoreRepository, clearscoreData: mockClearscoreData)
    }
    
    func registerDependency() {
        mockDependency.con
    }

}
