//
//  SearchAccountView.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class SearchAccountView: UIView {
    
    let viewModel: SearchAccountViewModel
    
    lazy var emptyAccountView: EmptySearchAccountView = {
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
    
    init(viewModel: SearchAccountViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        constructHierarchy()
        accountsTableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.defaultReuseIdentifier)
        backgroundColor = R.SearchAccount.searchAccountsViewBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        activateAccountsTableViewConstraints()
        accountsTableView.reloadData()
    }
    
}
