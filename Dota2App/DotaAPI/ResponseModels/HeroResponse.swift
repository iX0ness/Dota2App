//
//  HeroResponse.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 17/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct HeroResponse: Decodable {
    let id: Int
    let _name: String
    
    enum CodingKeys: String, CodingKey  {
        case id
        case _name = "localized_name"
    }
}
