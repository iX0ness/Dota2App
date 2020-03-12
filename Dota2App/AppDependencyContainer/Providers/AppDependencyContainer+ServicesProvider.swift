//
//  AppDependencyContainer+ServicesProvider.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 12/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation


protocol ServicesProvider {
    func makeAccountService() ->  AccountService
}

extension AppDependencyContainer: ServicesProvider {
    func makeAccountService() -> AccountService {
        return AccountService(networkingClient: makeNetworkingClient())
    }
}
