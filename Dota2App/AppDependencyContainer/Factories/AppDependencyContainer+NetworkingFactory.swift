//
//  AppDependencyContainer+NetworkingFactory.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol NetworkingFactory {
    func makeNetworkingClient() -> NetworkingClient
}

extension AppDependencyContainer: NetworkingFactory {
    func makeNetworkingClient() -> NetworkingClient {
        return NetworkingClient()
    }
}
