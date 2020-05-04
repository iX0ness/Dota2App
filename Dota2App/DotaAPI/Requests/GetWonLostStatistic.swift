//
//  GetWonLostStatistic.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct GetWonLostStatistic: APIRequest {
    typealias Response = WonLostResponse
    let accountID: String
    var path: String { return "players/\(accountID)/wl" }
    
    init(accountID: String) {
        self.accountID = accountID
    }
}
