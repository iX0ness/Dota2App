//
//  WonLostStatisticService.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

class WonLostStatisticService {
    private let networkingClient: NetworkingClient
    
    init(factory: NetworkingFactory) {
        networkingClient = factory.makeNetworkingClient()
    }
    
    func sendRequest(_ wonLostStatisticRequest: GetWonLostStatistic, completion: @escaping WonLostStatisticResult) -> URLSessionDataTask? {
        let task = networkingClient.send(request: wonLostStatisticRequest) { result in
            completion(result)
        }
        
        task?.resume()
        return task
    }
}
