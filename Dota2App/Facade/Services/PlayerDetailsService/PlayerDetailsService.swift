//
//  PlayerDetailsService.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation



class PlayerDetailsService {
    
    private let playerInfoService: PlayerInfoService
    private let wonLostStatisticService: WonLostStatisticService
    private let recentMatchesService: RecentMatchesService
    private let dispatchQueue = DispatchQueue(label: "concurrentQueue", qos: .default, attributes: .concurrent)
    private let dispatchGroup = DispatchGroup()
    
    init(factory: PlayerDetailsServicesFactory) {
        self.playerInfoService = factory.makePlayerInfoService()
        self.wonLostStatisticService = factory.makeWonLostStatisticService()
        self.recentMatchesService = factory.makeRecentMachesService()
    }
    
    func sendPlayerDetailsRequest(_ request: PlayerDetailsRequest, completion: @escaping PlayerDetailsCompletion) {
        var playerDetails = PlayerDetailsResponse()
        
        dispatchGroup.enter()
        _ = self.playerInfoService.sendRequest(request.playerInfoRequest, completion: { result in
            switch result {
                
            case .success(let playerInfo):
                playerDetails.playerInfo = (playerInfo, nil)
                
            case .failure(let error):
                playerDetails.playerInfo = (nil, error)
            }
            self.dispatchGroup.leave()
            
        })
        
        dispatchGroup.enter()
        _ = self.wonLostStatisticService.sendRequest(request.wonLostStatisticRequest, completion: { result in
            switch result {
                
            case .success(let wonLostStatistic):
                playerDetails.wonLostStatistic = (wonLostStatistic, nil)
                
            case .failure(let error):
                playerDetails.wonLostStatistic = (nil, error)
            }
            self.dispatchGroup.leave()
        })
    
        dispatchGroup.enter()
        _ = self.recentMatchesService.sendRequest(request.recentMatchesRequest, completion: { result  in
            switch result {
                
            case .success(let recentMatches):
                playerDetails.recentMatches = (recentMatches, nil)
                completion(playerDetails)
                
            case .failure(let error):
                completion(playerDetails)
                playerDetails.recentMatches = (nil, error)
            }
            self.dispatchGroup.leave()
        })

    }
}
