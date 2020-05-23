//
//  PlayerInfoResponse.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol ProfileRepresentable {
    var name: String { get }
    var country: String {get }
    var soloRank: String { get }
    var competitiveRank: String {get }
    var mmr: String { get }
    var avatarURLString: String { get }
    var emptyValuePlaceholder: String { get }
    
    func getProfileModel() -> Profile
}

struct PlayerInfoResponse: Decodable {
    let profile: ProfileResponse
    let solo_competitive_rank: Int?
    let competitive_rank: Int?
    let mmr_estimate: MMR_EstimanteResponse
    let leaderboard_rank: Int?
    let rank_tier: Int?
}

extension PlayerInfoResponse: ProfileRepresentable {
    
    internal var name: String {
        return profile.personaname ?? emptyValuePlaceholder
    }
    
    internal var country: String {
        return profile.loccountrycode ?? emptyValuePlaceholder
    }
    
    internal var soloRank: String {
        guard let soloRank = solo_competitive_rank else { return emptyValuePlaceholder }
        return String(soloRank)
    }
    
    internal var competitiveRank: String {
        guard let competitiveRank = competitive_rank else { return emptyValuePlaceholder }
        return String(competitiveRank)
    }
    
    internal var mmr: String {
        guard let mmr = mmr_estimate.estimate else { return emptyValuePlaceholder }
        return String(mmr)
    }
    
    var avatarURLString: String {
        return profile.avatarfull
    }
    
    internal var emptyValuePlaceholder: String {
        return "N/A"
    }
    
    func getProfileModel() -> Profile {
        return Profile(
            name: name,
            country: country,
            soloRank: soloRank,
            competitiveRank: competitiveRank,
            mmr: mmr,
            avatarURLString: avatarURLString)
    }
}
