//
//  AppDependencyContainer+PlayerDetailsServicesFactory.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol PlayerDetailsServicesFactory {
    func makePlayerInfoService() -> PlayerInfoService
    func makeWonLostStatisticService() -> WonLostStatisticService
    func makeRecentMachesService() -> RecentMatchesService
}

extension AppDependencyContainer: PlayerDetailsServicesFactory {
    func makePlayerInfoService() -> PlayerInfoService {
        return PlayerInfoService(factory: self)
    }
    
    func makeWonLostStatisticService() -> WonLostStatisticService {
        return WonLostStatisticService(factory: self)
    }
    
    func makeRecentMachesService() -> RecentMatchesService {
        return RecentMatchesService(factory: self)
    }
}
