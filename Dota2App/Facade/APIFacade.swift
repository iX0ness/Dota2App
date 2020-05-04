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
    func fetchPlayerDetails(_ accointID: String,
                            playerInfoCompletion: @escaping PlayerInfoCompletion,
                            wonLostStatisticCompletion: @escaping WonLostStatisticCompletion,
                            recentMatchesCompletion: @escaping RecentMatchesCompletion)
    var heroesRepo: HeroesRepository {get}
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
    internal let heroesRepository: HeroesRepository
    
    init(servicesProvider: ServicesProvider & HeroesRepositoryProvider) {
        self.accountsService = servicesProvider.makeAccountService()
        self.playerDetailsService = servicesProvider.makePlayerDetailsService()
        self.heroesRepository = servicesProvider.makeHeroesRepository()
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
    var heroesRepo: HeroesRepository {
        return heroesRepository
    }
    
    func fetchPlayerDetails(_ accointID: String,
                            playerInfoCompletion: @escaping PlayerInfoCompletion,
                            wonLostStatisticCompletion: @escaping WonLostStatisticCompletion,
                            recentMatchesCompletion: @escaping RecentMatchesCompletion) {
        
        let playerDetailsRequest = PlayerDetailsRequest(accountID: accointID)
        playerDetailsService.sendPlayerDetailsRequest(playerDetailsRequest,
                                                      
                                                      playerInfoCompletion: { result in
                                                        switch result {
                                                        case .success(let playerInfoResponse):
                                                            playerInfoCompletion(playerInfoResponse)
                                                        case .failure(let error):
                                                            print(error)
                                                        }
        },
                                                      wonLostStatisticCompletion: { result in
                                                        switch result {
                                                        case .success(let wonLostResponse):
                                                            wonLostStatisticCompletion(wonLostResponse)
                                                        case .failure(let error):
                                                            print(error)
                                                        }
        },
                                                      recentMatchesCompletion: { result in
                                                        switch result {
                                                        case .success(let recentMatchesResponse):
                                                            recentMatchesCompletion(recentMatchesResponse)
                                                        case .failure(let error):
                                                            print(error)
                                                        }
        })
        
    }
    
}
