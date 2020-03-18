//
//  SearchAccountViewController+UITableViewDataSource+Delegate.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

extension SearchAccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if viewModel.fetchedAccounts.count > 0 {
            tableView.backgroundView?.isHidden  = true
            tableView.separatorStyle = .singleLine
        } else {
            tableView.backgroundView?.isHidden  = false
            tableView.separatorStyle = .none
        }
        
        return viewModel.fetchedAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.defaultReuseIdentifier, for: indexPath) as! AccountTableViewCell
        let account = getAccount(at: indexPath)
        cell.configure(with: account)
        return cell
    }
        
}

extension SearchAccountViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension SearchAccountViewController {
    func getAccount(at indexPath: IndexPath) -> AccountResponse {
        return viewModel.fetchedAccounts[indexPath.row]
    }
    
    
}


