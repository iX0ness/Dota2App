//
//  PlayerDetails.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 11/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct PlayerDetailsResponse {
    var playerInfo: PlayerInfoResponse?
    var wonLostStatistic: WonLostResponse?
    var recentMatches: [MatchResponse]?
}


