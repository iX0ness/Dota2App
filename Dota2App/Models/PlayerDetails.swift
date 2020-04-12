//
//  PlayerDetails.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 11/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct PlayerDetails {
    var playerInfo: (playerInfro: PlayerInfoResponse?, error: Error?)?
    var wonLostStatistic: (wonLostStatistic: WonLostResponse?, error: Error?)?
    var recentMatches: (recentMatches: [MatchResponse]?, error: Error?)?
}
