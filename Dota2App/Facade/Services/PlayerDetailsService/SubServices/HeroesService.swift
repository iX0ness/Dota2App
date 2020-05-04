//
//  HeroesService.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 17/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

class HeroesRepository {
    
    var heroesHandler: (([HeroResponse]) -> Void)?
    private let networkingClient: NetworkingClient
    var heroes: [HeroResponse]? {
        didSet {
            if let heroes = heroes {
                heroesHandler?(heroes)
            }
        }
    }
    
    init(factory: NetworkingFactory) {
        networkingClient = factory.makeNetworkingClient()
        _ = sendRequest(GetHeroes(), completion: { [weak self] result in
            switch result {
            case .success(let heroesResponse):
                self?.heroes = heroesResponse
                
            case.failure(let error):
                print(error)
            }
        })
    }
    
    func sendRequest(_ heroesRequest: GetHeroes, completion: @escaping HeroesCompletion) -> URLSessionDataTask? {
        let task = networkingClient.send(request: heroesRequest) { result in
            switch result {
            case .success(let heroesResponse):
                completion(.success(heroesResponse))

            case .failure(let error):
                completion(.failure(error))
            }
        }
        task?.resume()
        return task
    }
}
