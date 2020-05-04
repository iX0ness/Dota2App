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
    private let dispatchQueue = DispatchQueue(label: "queue", qos: .default, attributes: .concurrent)
    
    init(factory: PlayerDetailsServicesFactory) {
        playerInfoService = factory.makePlayerInfoService()
        wonLostStatisticService = factory.makeWonLostStatisticService()
        recentMatchesService = factory.makeRecentMachesService()
    }
    
    func sendPlayerDetailsRequest(
        _ request: PlayerDetailsRequest,
        playerInfoCompletion: @escaping PlayerInfoResult,
        wonLostStatisticCompletion: @escaping WonLostStatisticResult,
        recentMatchesCompletion: @escaping RecentMatchesResult
    ) {
        
        dispatchQueue.async {
            _ = self.playerInfoService.sendRequest(request.playerInfoRequest, completion: { result in
                playerInfoCompletion(result)
            })
        }
        
        dispatchQueue.async {
            _ = self.wonLostStatisticService.sendRequest(request.wonLostStatisticRequest, completion: { result in
                wonLostStatisticCompletion(result)
            })
        }
        
        dispatchQueue.async {
            _ = self.recentMatchesService.sendRequest(request.recentMatchesRequest, completion: { result  in
                recentMatchesCompletion(result)
            })
        }
    
    }
}
