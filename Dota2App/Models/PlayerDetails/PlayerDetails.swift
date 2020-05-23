//
//  PlayerDetails.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 13/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

struct PlayerDetails {
    var profile: Profile?
    var wonLostStatistic:  WonLostStatistic?
    var recentMatches: [Match]?
}

struct Profile {
    let name: String
    let country: String
    let soloRank: String
    let competitiveRank: String
    let mmr: String
    let avatarURLString: String
}

struct WonLostStatistic {
    let won: String
    let lost: String
}

struct Match {
    let heroName: String
    let didWinMatch: String
    let duration: String
    let kills: String
    let assists: String
    let deaths: String
}

struct Hero {
    let name: String
}
