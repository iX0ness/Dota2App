//
//  EmptySearchAccountView.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 18/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class EmptySearchAccountView: UIView {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: R.SearchAccount.logoName))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let dimView: UIView = {
        let view = UIView()
        view.backgroundColor = R.SearchAccount.dimViewBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constructHierarchy()
        backgroundColor = R.SearchAccount.emptyViewBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activateLogoImageViewConstraints()
        activateDimViewconstraints()
    }
    
}
