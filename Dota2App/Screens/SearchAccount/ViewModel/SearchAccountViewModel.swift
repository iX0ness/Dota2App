//
//  SearchAccountViewModel.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

class SearchAccountViewModel {
    
    let accountsProvider: AccountServiceProvider
    
    init(accountsProvider: AccountServiceProvider) {
        self.accountsProvider = accountsProvider
        
        accountsProvider.fetchAccounts("kurwa") { (result) in
            switch result {
            case .success(let accounts):
                print(accounts)
                
            case .failure(let error):
                print(error)
            }
        }
        
    }

    
    
    var accounts = [Account(image: UIImage(named: "prof1")!,
                            title: "No name 1"),
                    Account(image: UIImage(named: "prof2")!,
                            title: "No name 2"),
                    Account(image: UIImage(named: "prof3")!,
                            title: "No name 2")]
    
}
