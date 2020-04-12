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
        self.networkingClient = factory.makeNetworkingClient()
    }
    
    func sendRequest(_ wonLostStatisticRequest: GetWonLostStatistic, completion: @escaping WonLostStatisticCompletion) -> URLSessionDataTask? {
        let task = networkingClient.send(request: wonLostStatisticRequest) { result in
            switch result {
            case .success(let wonLostStatistic):
                completion(.success(wonLostStatistic))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        task?.resume()
        return task
    }
}
