//
//  SearchAccountViewModel.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

class SearchAccountViewModel {
    
    private let accountsProvider: AccountServiceProvider
    var dataTask: URLSessionDataTask?
    
    
    var didFetchAccounts: (() -> Void)?
    
    var fetchedAccounts: [AccountResponse] = [] {
        didSet {
            didFetchAccounts?()
        }
    }
    
    init(accountsProvider: AccountServiceProvider) {
        self.accountsProvider = accountsProvider
        
    }
    
    func getAccounts(named accountName: String) {
        let _ = accountsProvider.fetchAccounts(accountName) { (result) in
            switch result {
            case .success(let accounts):
                self.fetchedAccounts = accounts
            case .failure(let error):
                print(error)
            }
        }
    }
    
}



