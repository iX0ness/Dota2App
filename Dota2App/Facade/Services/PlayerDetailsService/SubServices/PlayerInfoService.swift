//
//  PlayerInfoService.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

class PlayerInfoService {
    private let networkingClient: NetworkingClient
    
    init(factory: NetworkingFactory) {
        networkingClient = factory.makeNetworkingClient()
    }
    
    func sendRequest(_ getPlayerInfoRequest: GetPlayerInfo, completion: @escaping PlayerInfoResult) -> URLSessionDataTask? {
        let task = networkingClient.send(request: getPlayerInfoRequest) { result in
            print(result)
            completion(result)
        }
        
        task?.resume()
        return task
    }
}
