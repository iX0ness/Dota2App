//
//  GetPlayerInfo.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct GetPlayerInfo: APIRequest {
    typealias Response = PlayerInfoResponse
    
    var path: String {
        return "players/\(accountID)"
    }
    
    let accountID: String
    
    init(accountID: String) {
        self.accountID = accountID
    }
}
