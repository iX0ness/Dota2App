//
//  DotaClient.swift
//  Dota2App
//
//  Created by Levchuk Misha on 05/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

class NetworkingClient: APIClient {
    
    private let session = URLSession(configuration: .default)
    private var baseURL = URL(string: "https://api.opendota.com/api/")!
    
    func send<T: APIRequest>(request: T, completion: @escaping CompletionHandler<T.Response>) {
        
        guard let url = createEndpoint(for: request) else {
            completion(.failure(APIError.urlConstructionError))
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard response != nil else {
                completion(.failure(error!))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.noDataError))
                return
            }
            
            do {
                let parsedData = try JSONDecoder().decode(T.Response.self, from: data)
                completion(.success(parsedData))
            } catch {
                print(error)
                completion(.failure(APIError.parsingError(message: error.localizedDescription)))
            }
            
        }
        dataTask.resume()
    }
    
    
    func createEndpoint<T: APIRequest>(for request: T) ->  URL? {
        guard let url = URL(string: request.path, relativeTo: baseURL) else {
            return nil
        }
        return url
    }
    
}
