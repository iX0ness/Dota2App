//
//  DebouncerTests.swift
//  Dota2AppTests
//
//  Created by Mykhaylo Levchuk on 30/05/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import XCTest
@testable import Dota2App

class DebouncerTests: XCTestCase {
    
    var sut: Debouncer!
    
    override func setUp() {
        sut = Debouncer(delay: 0.8)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrevoiusClosureCanceled() {
        let canceledExpectation = expectation(description: "Canceled task")
        canceledExpectation.isInverted = true
        
        let completedExpectation = expectation(description: "Completed task")
        
        sut.run {
            canceledExpectation.fulfill()
        }
        
        sut.run {
            completedExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0.85, handler: nil)
    }

}
