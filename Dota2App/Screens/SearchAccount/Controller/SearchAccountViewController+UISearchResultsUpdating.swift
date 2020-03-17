//
//  SearchAccountViewController+UISearchResultsUpdating.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 17/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit


extension SearchAccountViewController: UISearchResultsUpdating {
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    private var isSearching: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        searchForAccount(named: searchController.searchBar.text!)
    }
    
    private func searchForAccount(named accountName: String) {
        viewModel.getAccounts(named: accountName)
    }
    
}

extension SearchAccountViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchedAccounts.removeAll()
    }
}
