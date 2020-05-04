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
        networkingClient = factory.makeNetworkingClient()
    }
    
    func sendRequest(_ recentMatchesRequest: GetRecentMatches, completion: @escaping RecentMatchesResult) -> URLSessionDataTask? {
        let task = networkingClient.send(request: recentMatchesRequest) { result in
            completion(result)
        }
        task?.resume()
        return task
    }
}
