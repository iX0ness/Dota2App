//
//  UIView+FitToContainerView.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 05/05/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

extension UIView {
    func placeInContainer(_ superView: UIView) {
        superView.addSubview(self)
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superView.topAnchor),
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor)
        ])
    }
}
