//
//  SearchAccountView+Constraints.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

protocol SearchAccountViewConstraints {
    func constructHierarchy()
    func activateAccountsTableViewConstraints()
}

extension SearchAccountView: SearchAccountViewConstraints {
    func constructHierarchy() {
        addSubview(accountsTableView)
    }

    func activateAccountsTableViewConstraints() {
        NSLayoutConstraint.activate([
            accountsTableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            accountsTableView.topAnchor.constraint(equalTo: topAnchor),
            accountsTableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            accountsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
