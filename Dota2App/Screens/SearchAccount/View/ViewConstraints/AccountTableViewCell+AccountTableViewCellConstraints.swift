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
    func activateDimViewConstraints()
    func activateAccountImageViewConstraints()
    func activateAccountTitleLabelConstraints()
}

extension AccountTableViewCell: AccountTableViewCellConstraints {
    
    func constructHierarchy() {
        addSubview(dimView)
        addSubview(accountImageView)
        addSubview(accountTitleLabel)
    }
    
    func activateDimViewConstraints() {
        NSLayoutConstraint.activate([
            dimView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dimView.topAnchor.constraint(equalTo: topAnchor),
            dimView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dimView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func activateAccountImageViewConstraints() {
        NSLayoutConstraint.activate([
            accountImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            accountImageView.widthAnchor.constraint(equalToConstant: 60),
            accountImageView.heightAnchor.constraint(equalToConstant: 60),
            accountImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func activateAccountTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            accountTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: accountImageView.trailingAnchor, multiplier: 3.0),
            accountTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            accountTitleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
    
}

