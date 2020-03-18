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
        
        /// Setup table view delegate
        view.accountsTableView.dataSource = self
        view.accountsTableView.delegate = self
        
        /// Setup searchController
        //view.accountsTableView.tableHeaderView = searchController.searchBar
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        
        /// Setup navigationBar
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.topItem?.title = "Search account"
            navigationBar.prefersLargeTitles = true
            navigationBar.barTintColor = R.SearchAccount.navBarColor
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
