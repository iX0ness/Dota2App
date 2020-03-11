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
        return viewModel.fetchedAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.defaultReuseIdentifier, for: indexPath) as! AccountTableViewCell
        let account = getAccount(at: indexPath)
        cell.configure(with: account)
        //cell.accountTitleLabel.text = viewModel.fetchedAccounts[indexPath.row].personaname
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


