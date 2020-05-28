//
//  SearchAccountView.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class SearchAccountView: UIView {
    
    // MARK: - Object Properties
    
    let viewModel: SearchAccountViewModel
    
    // MARK: - View Properties
    
    private lazy var emptyAccountView: EmptySearchAccountView = {
        let view = EmptySearchAccountView()
        return view
    }()
    
    lazy var accountsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundView = emptyAccountView
        tableView.backgroundColor = R.SearchAccount.accountsTableViewBackgroundColor
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - View Lifecycle
    
    init(viewModel: SearchAccountViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        accountsTableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.defaultReuseIdentifier)
        backgroundColor = R.SearchAccount.searchAccountsViewBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
        accountsTableView.reloadData()
    }
    
    // MARK: - Object Methods
    
    // MARK: - Setup View Hierarchy
    
    private func setupLayout() {
        addSubviews()
        activateConstraints()
    }
    
    private func addSubviews() {
        addSubview(accountsTableView)
    }
    
    private func activateConstraints() {
        activateAccountsTableViewConstraints()
    }
    
    private func activateAccountsTableViewConstraints() {
        NSLayoutConstraint.activate([
            accountsTableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            accountsTableView.topAnchor.constraint(equalTo: topAnchor),
            accountsTableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            accountsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: - Constants
}
