//
//  PlayerInfoResponse.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct PlayerInfoResponse: Decodable {
    let profile: ProfileResponse?
    let solo_competitive_rank: Int?
    let competitive_rank: Int?
    let mmr_estimate: MMR_EstimanteResponse
    let leaderboard_rank: Int?
    let rank_tier: Int?
}
