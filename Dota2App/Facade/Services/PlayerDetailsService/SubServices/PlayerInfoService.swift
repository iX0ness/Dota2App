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
        self.networkingClient = factory.makeNetworkingClient()
    }
    
    func sendRequest(_ getPlayerInfoRequest: GetPlayerInfo, completion: @escaping PlayerInfoCompletion) -> URLSessionDataTask? {
        let task = networkingClient.send(request: getPlayerInfoRequest) { result in
            switch result {
            case .success(let playerInfo):
                completion(.success(playerInfo))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        task?.resume()
        return task
    }
}
