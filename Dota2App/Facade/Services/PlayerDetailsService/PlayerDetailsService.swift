//
//  PlayerDetailsService.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation


class PlayerDetailsService {
    
    let playerInfoService: PlayerInfoService
    let wonLostStatisticService: WonLostStatisticService
    let recentMatchesService: RecentMatchesService
    
    init(factory: PlayerDetailsServicesFactory) {
        self.playerInfoService = factory.makePlayerInfoService()
        self.wonLostStatisticService = factory.makeWonLostStatisticService()
        self.recentMatchesService = factory.makeRecentMachesService()
    }
    
}
