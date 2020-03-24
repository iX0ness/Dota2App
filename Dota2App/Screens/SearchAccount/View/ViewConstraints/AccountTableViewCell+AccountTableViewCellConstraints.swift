//
//  AccountTableViewCell+Constraints.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol AccountTableViewCellConstraints {
    func constructHierarchy()
    func activateAccountDetailsStackViewConstraints()
}

extension AccountTableViewCell: AccountTableViewCellConstraints {

    func constructHierarchy() {
        addSubview(dimView)
        addSubview(accountDetailsStackView)
    }

    func activateAccountDetailsStackViewConstraints() {
        NSLayoutConstraint.activate([
            accountDetailsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: layoutMarginsGuide.leadingAnchor, multiplier: 1.0),
            accountDetailsStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            accountDetailsStackView.heightAnchor.constraint(equalToConstant: 50),
            accountDetailsStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func activateDimViewConstraints() {
        NSLayoutConstraint.activate([
            dimView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dimView.topAnchor.constraint(equalTo: topAnchor),
            dimView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dimView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

