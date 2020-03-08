//
//  APIProtocols.swift
//  Dota2App
//
//  Created by Levchuk Misha on 04/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

typealias CompletionHandler<Value> = (Result<Value, Error>) -> Void

protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    var path: String {get}
}

protocol APIClient {
    func send<T: APIRequest>(request: T, completion: @escaping CompletionHandler<T.Response>)
}
