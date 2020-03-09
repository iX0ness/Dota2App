//
//  A.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct AccountResponse: Decodable {
    let account_id : Int
    let personaname : String
    let avatarfull : String
}
