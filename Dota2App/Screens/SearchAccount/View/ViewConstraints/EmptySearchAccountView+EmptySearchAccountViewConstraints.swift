//
//  EmptySearchAccountView+EmptySearchAccountViewConstraints.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 18/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol EmptySearchAccountViewConstraints {
    func constructHierarchy()
    func activateLogoImageViewConstraints()
    func activateDimViewconstraints()
    
}

extension EmptySearchAccountView: EmptySearchAccountViewConstraints {
    
    
    
    
    
    
    func constructHierarchy() {
        addSubview(logoImageView)
        addSubview(dimView)
    }
    
    func activateLogoImageViewConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func activateDimViewconstraints() {
        NSLayoutConstraint.activate([
            dimView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dimView.topAnchor.constraint(equalTo: topAnchor),
            dimView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dimView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
}
