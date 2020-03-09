//
//  GetAccounts.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct GetAccounts: APIRequest {
    typealias Response = [AccountResponse]
    var path: String {
        return "search?q=\(accountName)"
    }
    
    let accountName: String
    
    init(accountName: String) {
        self.accountName = accountName
    }
}
