//
//  ViewController.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class SearchAccountViewController: UIViewController {
    
    // MARK: - Object properties
    
    let debouncer: Debouncer
    let factory: SearchControllerFactory & DebouncerFactory & PlayerDetailsFactory
    let searchController: UISearchController
    let viewModel: SearchAccountViewModel
    
    // MARK: - Object Lifecycle
    
    init(viewModel: SearchAccountViewModel, factory: SearchControllerFactory & DebouncerFactory & PlayerDetailsFactory) {
        self.viewModel = viewModel
        self.searchController = factory.makeSearchController()
        self.debouncer = factory.makeDebouncer(delay: 0.8)
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = SearchAccountView(viewModel: viewModel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setDelegates()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSearchController()
        setupNavigationBarAppearance()
    }
    
    // MARK: - Obejct Methods
    
    private func bind() {
        guard let view = view as? SearchAccountView else { return }
        viewModel.didFetchAccounts = {
            DispatchQueue.main.async {
                view.accountsTableView.reloadData()
            }
        }
    }
    
    private func hideBackgroundView(in tableView: UITableView) {
        tableView.backgroundView?.isHidden  = true
        tableView.separatorStyle = .none
    }
    
    private func setDelegates() {
        guard let view = view as? SearchAccountView else { return }
        view.accountsTableView.dataSource = self
        view.accountsTableView.delegate = self
        searchController.searchBar.delegate = self
    }
    
    private func setupNavigationBarAppearance() {
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.topItem?.title = "Search account"
            navigationBar.prefersLargeTitles = true
            navigationBar.barTintColor = R.SearchAccount.navBarColor
            navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        }
    }
    
    private func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.tintColor = R.SearchAccount.searchBarTintColor
        searchController.searchBar.searchTextField.textColor = R.SearchAccount.searchTextFieldTextColor
    }
    
    private func showBackGroundView(in tableView: UITableView) {
        tableView.backgroundView?.isHidden  = false
        tableView.separatorStyle = .singleLine
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchAccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if viewModel.count > 0 {
            tableView.isScrollEnabled = true
            hideBackgroundView(in: tableView)
            return viewModel.count
        } else {
            tableView.isScrollEnabled = false
            showBackGroundView(in: tableView)
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.defaultReuseIdentifier, for: indexPath) as? AccountTableViewCell else {
            fatalError("Cell must be dequeued")
        }
    
        let account = viewModel.getAccount(at: indexPath)
        cell.configure(with: account)
        return cell
    }
    
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

// MARK: - UISearchResultsUpdating

extension SearchAccountViewController: UISearchResultsUpdating {
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isSearching: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        debouncer.run { [weak self] in
            guard let accountName = searchController.searchBar.text else { return }
            self?.searchForAccount(named: accountName)
        }
    }
    
    private func searchForAccount(named accountName: String) {
        viewModel.getAccounts(named: accountName)
    }
    
}

// MARK: - UISearchBarDelegate

extension SearchAccountViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        guard let view = view as? SearchAccountView else { return }
        view.accountsTableView.setContentOffset(.zero, animated: false)
        viewModel.fetchedAccounts = []
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
