//
//  RecentMatchesService.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

class RecentMatchesService {
    private let networkingClient: NetworkingClient
    
    init(factory: NetworkingFactory) {
        self.networkingClient = factory.makeNetworkingClient()
    }
    
    func sendRequest(_ recentMatchesRequest: GetRecentMatches, completion: @escaping RecentMatchesCompletion) -> URLSessionDataTask? {
        let task = networkingClient.send(request: recentMatchesRequest) { result in
            switch result {
            case .success(let recentMatches):
                completion(.success(recentMatches))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
        task?.resume()
        return task
    }
}
