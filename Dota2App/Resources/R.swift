//
//  R.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

//typealias AccountsCompletion<Value: Decodable> = (Result<Value, Error>) -> Void
enum R {
    enum SearchAccount {
        static let accountImage = "account"
    }
    
    enum TypeAliases {
        typealias AccountsCompletion<Value: Decodable> = (Result<Value, Error>) -> Void
    }
}
