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
        var playerDetails = PlayerDetails()
        
        dispatchGroup.enter()
        _ = self.playerInfoService.sendRequest(request.playerInfoRequest, completion: { result in
            switch result {
                
            case .success(let playerInfoResponse):
                playerDetails.profile = playerInfoResponse.getModel()
                
            case .failure(let error):
                print(error)
            }
            self.dispatchGroup.leave()
            
        })
        
        dispatchGroup.enter()
        _ = self.wonLostStatisticService.sendRequest(request.wonLostStatisticRequest, completion: { result in
            switch result {
                
            case .success(let wonLostResponse):
                playerDetails.wonLostStatistic = wonLostResponse.getModel()
                
            case .failure(let error):
                print(error)
            }
            self.dispatchGroup.leave()
        })
    
        dispatchGroup.enter()
        _ = self.recentMatchesService.sendRequest(request.recentMatchesRequest, completion: { result  in
            switch result {
                
            case .success(let recentMatches):
                playerDetails.recentMatches = recentMatches.map{ $0.getModel()}
                completion(playerDetails)
                
            case .failure(let error):
                completion(playerDetails)
                print(error)
            }
            self.dispatchGroup.leave()
        })

    }
}
