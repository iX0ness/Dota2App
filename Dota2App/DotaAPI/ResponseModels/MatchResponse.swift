//
//  MatchResponse.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct MatchResponse: Decodable {
    let match_id: Int
    let player_slot: Int
    let radiant_win : Bool
    let duration : Int
    let hero_id : Int
    let kills : Int
    let deaths : Int
    let assists : Int
}
