//
//  AppDependencyContainer+NetworkingFactory.swift
//  Dota2App
//
//  Created by Levchuk Misha on 09/03/2020.
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
