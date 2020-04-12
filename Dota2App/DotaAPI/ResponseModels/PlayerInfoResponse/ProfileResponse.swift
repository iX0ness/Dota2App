//
//  Profile.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct ProfileResponse: Decodable {
    let account_id: Int
    let personaname: String?
    let name: String?
    let plus: Bool?
    let cheese: Int
    let steamid: String?
    let avatar: String?
    let avatarmedium: String?
    let avatarfull: String?
    let profileurl: String?
    let last_login: String?
    let loccountrycode: String?
    let is_contributor: Bool
}
