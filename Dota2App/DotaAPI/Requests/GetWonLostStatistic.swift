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
    
    var path: String {
        return "players/\(accountID)/wl"
    }
    
    let accountID: String
    
    init(accountID: String) {
        self.accountID = accountID
    }
    
    
}
