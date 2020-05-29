//
//  SearchAccountViewModel.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class SearchAccountViewModel {
    
    // MARK: - Object properties
    
    private let accountsProvider: AccountServiceProvider
    private var dataTask: URLSessionDataTask? {
        didSet {
            dataTask?.cancel()
        }
    }
    var didFetchAccounts: (() -> Void)?
    
    var fetchedAccounts: [AccountResponse] = [] {
        didSet {
            didFetchAccounts?()
        }
    }
    
    var count: Int {
        return !fetchedAccounts.isEmpty ? fetchedAccounts.count : 0
    }
    
    // MARK: - Object Lifecycle
    
    init(accountsProvider: AccountServiceProvider) {
        self.accountsProvider = accountsProvider
    }
    
    // MARK: - Object Methods
    
    func getAccounts(named accountName: String) {
        let _ = accountsProvider.fetchAccounts(accountName) { result in
            switch result {
            case .success(let accounts):
                self.fetchedAccounts = accounts
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getAccount(at indexPath: IndexPath) -> AccountResponse? {
        guard !fetchedAccounts.isEmpty else { return nil }
        return fetchedAccounts[indexPath.section]
    }
    
}
