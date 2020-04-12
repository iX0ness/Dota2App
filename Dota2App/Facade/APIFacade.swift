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

protocol PlayerDetailsServiceProvider {
    func fetchPlayerDetails(_ accointID: String, completion: @escaping  PlayerDetailsCompletion)
}

struct PlayerDetailsRequest {
    let playerInfoRequest: GetPlayerInfo
    let wonLostStatisticRequest: GetWonLostStatistic
    let recentMatchesRequest: GetRecentMatches
    
    init(accountID: String) {
        playerInfoRequest = GetPlayerInfo(accountID: accountID)
        wonLostStatisticRequest = GetWonLostStatistic(accountID: accountID)
        recentMatchesRequest = GetRecentMatches(accountID: accountID)
    }
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
        let accountRequest = GetAccounts(accountName: accountName)
        
        let task = accountsService.sendRequest(accountRequest) { (result) in
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

extension APIFacade: PlayerDetailsServiceProvider {
    func fetchPlayerDetails(_ accointID: String, completion: @escaping PlayerDetailsCompletion) {
        let playerDetailsRequest = PlayerDetailsRequest(accountID: accointID)
        playerDetailsService.sendPlayerDetailsRequest(playerDetailsRequest) { (result) in
            completion(result)
        }
        
    }
    
}
