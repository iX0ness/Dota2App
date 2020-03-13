//
//  AccountService.swift
//  Dota2App
//
//  Created by Levchuk Misha on 09/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

class AccountService {

    private let networkingClient: NetworkingClient
    
    init(networkingClient: NetworkingClient = NetworkingClient()) {
        self.networkingClient = networkingClient
    }

    func getAccounts(with accountName: String, completion: @escaping AccountsCompletion<[AccountResponse]>) -> URLSessionDataTask? {
        let accountRequest = GetAccounts(accountName: accountName)

        let task = networkingClient.send(request: accountRequest) { (result) in
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


