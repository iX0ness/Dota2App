//
//  SearchAccountViewModelTests.swift
//  Dota2AppTests
//
//  Created by Mykhaylo Levchuk on 30/05/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import XCTest
@testable import Dota2App

class SearchAccountViewModelTests: XCTestCase {
    
    var dependencyContainer: AppDependencyContainer!
    var sut: SearchAccountViewModel!
    var mockAccounts: [AccountResponse]!
    
    override func setUp() {
        dependencyContainer = AppDependencyContainer()
        mockAccounts = [
            AccountResponse(account_id: 1, personaname: "John", avatarURLString: "https://dota.john.jpg"),
            AccountResponse(account_id: 2, personaname: "Sam", avatarURLString: "https://dota.sam.jpg"),
            AccountResponse(account_id: 3, personaname: "Steven", avatarURLString: "https://dota.steven.jpg"),
            AccountResponse(account_id: 4, personaname: "Paul", avatarURLString: "https://dota.paul.jpg"),
        ]
        sut = SearchAccountViewModel(accountsProvider: dependencyContainer.apiFacade)
    }

    override func tearDown() {
        dependencyContainer = nil
        sut = nil
    }

    func test_getAccount() {
        sut.fetchedAccounts = mockAccounts
        let indexPath = IndexPath(row: 0, section: 1)
        let account = sut.getAccount(at: indexPath)
        XCTAssertNotNil(account, "Function returned account. Account at passed indexPath exists")
        
        sut.fetchedAccounts = []
        let accountOptional = sut.getAccount(at: indexPath)
        XCTAssertNil(accountOptional, "Function returned nil - no accounts data")
        
    }

}
