//
//  APIFacade.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol AccountServiceProvider {
    func fetchAccounts(_ accountName: String, completion: @escaping AccountsCompletion<[AccountResponse]>) -> URLSessionDataTask?
}

class APIFacade {
    
    private let accountsService: AccountService
    private let playerDetailsService: PlayerDetailsService
    
    init(servicesProvider: ServicesProvider) {
        self.accountsService = servicesProvider.makeAccountService()
        self.playerDetailsService = servicesProvider.makePlayerDetailsService()
    }
   
}

extension APIFacade: AccountServiceProvider {
    func fetchAccounts(_ accountName: String, completion: @escaping AccountsCompletion<[AccountResponse]>) -> URLSessionDataTask? {
        let task = accountsService.getAccounts(with: accountName) { (result) in
            switch result {
            case .success(let accounts):
                completion(.success(accounts))
        
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        return task
    }
}

