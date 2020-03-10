//
//  AppDependencyContainer+APIFacadeFactory.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol APIFacadeFactory {
    func makeAccountService() -> AccountService
    
}

extension AppDependencyContainer: APIFacadeFactory {
    func makeAccountService() -> AccountService {
        return AccountService(networkingClient: makeNetworkingClient())
    }
    
    
}
