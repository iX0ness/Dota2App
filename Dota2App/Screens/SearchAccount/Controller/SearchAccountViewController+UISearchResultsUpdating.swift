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
        debouncer.run { [weak self] in
            guard let accountName = searchController.searchBar.text else {return}
            self?.searchForAccount(named: accountName)
        }
    }
    
    private func searchForAccount(named accountName: String) {
        viewModel.getAccounts(named: accountName)
    }
    
}

extension SearchAccountViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchedAccounts.removeAll()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        setEditingColor(for: searchBar, color: R.SearchAccount.searchTextFieldTextColor)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        setStandardColor(for: searchBar, color: .lightGray)
    }
    
    private func setEditingColor(for searchBar: UISearchBar, color: UIColor) {
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "",
                                                                 attributes: [NSAttributedString.Key.foregroundColor : color])
        }
    }
    
    private func setStandardColor(for searchBar: UISearchBar, color: UIColor) {
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "",
                                                                 attributes: [NSAttributedString.Key.foregroundColor : color])
        }
    }
    
}
