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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if viewModel.fetchedAccounts.count > 0 {
            tableView.isScrollEnabled = true
            hideBackgroundView(in: tableView)
            return viewModel.fetchedAccounts.count
        } else {
            tableView.isScrollEnabled = false
            showBackGroundView(in: tableView)
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fetchedAccounts.count > 0 ? 1 : 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.defaultReuseIdentifier, for: indexPath) as? AccountTableViewCell else {
            fatalError("Cell must be dequeued")
        }
        guard viewModel.fetchedAccounts.count > indexPath.section else {return UITableViewCell()}
        guard let account = getAccount(at: indexPath) else {return UITableViewCell()}
        cell.configure(with: account)
        return cell
    }
        
}

extension SearchAccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerDetailsViewController = factory.makePlayerDetailsViewController()
        navigationController?.pushViewController(playerDetailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

extension SearchAccountViewController {
    func getAccount(at indexPath: IndexPath) -> AccountResponse? {
        return viewModel.fetchedAccounts[indexPath.section]
    }
    
    private func hideBackgroundView(in tableView: UITableView) {
        tableView.backgroundView?.isHidden  = true
        tableView.separatorStyle = .none
    }
    
    private func showBackGroundView(in tableView: UITableView) {
        tableView.backgroundView?.isHidden  = false
        tableView.separatorStyle = .singleLine
    }
}


