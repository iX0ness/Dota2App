//
//  SearchAccountViewController+Extension.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 13/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

extension SearchAccountViewController {
    func setupView(_ view: SearchAccountView) {
        view.accountsTableView.dataSource = self
        view.accountsTableView.delegate = self
        view.accountsTableView.tableHeaderView = searchController.searchBar
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.topItem?.title = "Search account"
            navigationBar.prefersLargeTitles = true
        }
        
    }
    
    func bindView(_ view: SearchAccountView) {
        viewModel.didFetchAccounts = {
            DispatchQueue.main.async {
                view.accountsTableView.reloadData()
            }
        }
    }
    
    
}
