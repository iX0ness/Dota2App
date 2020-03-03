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
        return viewModel.accounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.defaultReuseIdentifier, for: indexPath) as! AccountTableViewCell
        cell.accountImageView.image = viewModel.accounts[indexPath.row].image
        cell.accountTitleLabel.text = viewModel.accounts[indexPath.row].title
        return cell
     }

    
}
