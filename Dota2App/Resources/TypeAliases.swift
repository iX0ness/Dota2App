//
//  TypeAliases.swift
//  Dota2App
//
//  Created by Levchuk Misha on 10/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
typealias AccountsCompletion<Value: Decodable> = (Result<Value, Error>) -> Void
