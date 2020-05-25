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

extension UIView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}
