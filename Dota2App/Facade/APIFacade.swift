//
//  APIFacade.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol AccountServiceProvider {
    //var accountService: AccountService {get}
    func fetchAccounts(_ accountName: String, completion: @escaping AccountsCompletion<[AccountResponse]>)
}


class APIFacade {
    
    private let accountsService: AccountService
    init(accountsService: AccountService = AccountService()) {
        self.accountsService = accountsService
    }
   
}

extension APIFacade: AccountServiceProvider {
    func fetchAccounts(_ accountName: String, completion: @escaping AccountsCompletion<[AccountResponse]>) {
        accountsService.getAccounts(with: accountName) { (result) in
            switch result {
            case .success(let accounts):
                completion(.success(accounts))
        
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

