//
//  MatchResponse.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol MatchRepresentable {
    //var hero: Hero { get }
    var matchResult: String { get }
    var duration: String { get }
    var kills: String { get }
    var assists: String { get }
    var deaths: String { get }
    
    func getMatchModel() -> Match
}

struct MatchResponse: Decodable {
    let match_id: Int
    let player_slot: Int
    let radiant_win: Bool
    let _duration: Int
    let hero_id: Int
    let _kills: Int
    let _deaths: Int
    let _assists: Int
    
    
    enum CodingKeys: String, CodingKey {
        case match_id
        case player_slot
        case radiant_win
        case _duration = "duration"
        case hero_id
        case _kills = "kills"
        case _deaths = "deaths"
        case _assists = "assists"
    
    }
}

extension MatchResponse: MatchRepresentable {
    
    var heroName: String {
        return getHeroName(by: hero_id) ?? "Unknown"
    }
    
    var matchResult: String {
        let didWinMatch = isRadiantTeam(player_slot) ? radiant_win : !radiant_win
        return didWinMatch ? "Won" : "Lost"
    }
    
    var duration: String {
        return getFormattedDuration(fromMiliseconds: _duration)
    }
    
    var kills: String {
        return String(_kills)
    }
    
    var assists: String {
        return String(_assists)
    }
    
    var deaths: String {
        return String(_deaths)
    }
    
    func getMatchModel() -> Match {
        return Match(heroName: heroName, didWinMatch: matchResult, duration: duration, kills: kills, assists: assists, deaths: deaths)
    }
    
    private func isRadiantTeam(_ slot: Int) -> Bool {
        return slot < 128
    }
    
    private func getFormattedDuration(fromMiliseconds miliSeconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        let formattedDuration = formatter.string(from: TimeInterval(miliSeconds))
        return formattedDuration ?? "00:00:00"
    }
    
    func getHeroName(by heroID: Int) -> String? {
        guard let result = UserDefaults.standard.getHeroes() else { return nil }
        switch result {
        case .success(let heroes):
            let hero = heroes.first(where: { $0.id == heroID })
            return hero?._name
            
        case .failure(let error):
            print(error)
            return nil
        }
    }
}

