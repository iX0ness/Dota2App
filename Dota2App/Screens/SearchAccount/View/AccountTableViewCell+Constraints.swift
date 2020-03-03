//
//  AccountTableViewCell+Constraints.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

extension AccountTableViewCell {

    func constructHierarchy() {
        addSubview(accountImageView)
    }

    func activateAccountImageViewConstraints() {
        NSLayoutConstraint.activate([
            accountImageView.widthAnchor.constraint(equalToConstant: 50),
            accountImageView.heightAnchor.constraint(equalToConstant: 50),
            accountImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            accountImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
