//
//  SearchAccountView+Constraints.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewConstraints {
    func constructHierarchy()
    func activateAccountsTableViewConstraints()
}

extension SearchAccountView: SearchViewConstraints {
    func constructHierarchy() {
        addSubview(accountsTableView)
    }

    func activateAccountsTableViewConstraints() {
        NSLayoutConstraint.activate([
            accountsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            accountsTableView.topAnchor.constraint(equalTo: topAnchor),
            accountsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            accountsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
