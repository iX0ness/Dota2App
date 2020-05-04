//
//  GetRecentMatches.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct GetRecentMatches: APIRequest {
    typealias Response = [MatchResponse]
    let accountID: String
    var path: String { return "players/\(accountID)/recentMatches" }
    
    init(accountID: String) {
        self.accountID = accountID
    }
}
