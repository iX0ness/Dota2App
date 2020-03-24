//
//  R.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

enum R {
    enum SearchAccount {
        static let accountImage = "account"
        static let logoName = "logo"
        static let emptyViewBackgroundColor = UIColor(red: 22/255, green: 26/255, blue: 39/255, alpha: 1.0)
        static let dimViewBackgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.12)
        static let navBarColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1.0)
        static let searchBarTintColor = UIColor(red: 51/255, green: 53/255, blue: 65/255, alpha: 1.0)
        static let searchTextFieldTextColor = UIColor(red: 51/255, green: 53/255, blue: 65/255, alpha: 1.0)
        static let accountsTableViewBackgroundColor = UIColor(red: 51/255, green: 53/255, blue: 65/255, alpha: 1.0)
        static let searchAccountsViewBackgroundColor = UIColor(red: 51/255, green: 53/255, blue: 65/255, alpha: 1.0)
        static let accountCellBackgroundColor = UIColor(red: 82/255, green: 85/255, blue: 114/255, alpha: 0.3)
    }
    
    enum TypeAliases {
        typealias AccountsCompletion<Value: Decodable> = (Result<Value, Error>) -> Void
    }
}
