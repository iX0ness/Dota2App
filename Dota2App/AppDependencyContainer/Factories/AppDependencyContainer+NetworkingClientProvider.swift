//
//  AppDependencyContainer+NetworkingClient.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 12/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation


protocol NetworkingClientProvider {
    func makeNetworkingClient() -> NetworkingClient
}

extension AppDependencyContainer: NetworkingClientProvider {
    func makeNetworkingClient() -> NetworkingClient {
        return NetworkingClient()
    }
}
