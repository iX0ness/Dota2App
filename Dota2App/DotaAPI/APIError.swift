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
    case parsingError
    case urlError

    var description: String{
        switch self {
        case .noDataError:
            return "No data: source does not contain data for your request"

        case.parsingError:
            return "Parsing error: data can't be parsed to specified format"

        case .urlError:
            return "URL error: the url can't be constructed for this path"
        }
    }
}
