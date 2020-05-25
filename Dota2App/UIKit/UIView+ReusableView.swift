//
//  UIView+ReusableView.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 23/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

