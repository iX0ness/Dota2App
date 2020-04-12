//
//  APIError.swift
//  Dota2App
//
//  Created by Levchuk Misha on 08/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case noDataError
    case parsingError(message: String)
    case urlConstructionError
    
    var description: String {
        switch self {
        case .noDataError: return "No data: source does not contain data for your request"
            
        case .parsingError(let message):
            return """
            Parsing error: data can't be parsed to specified format.
            Message: \(message)
            """
            
        case .urlConstructionError: return "URL error: the url can't be constructed for this path"
        }
    }
}

