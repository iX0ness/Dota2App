//
//  AccountTableViewCell.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

class AccountTableViewCell: UITableViewCell {
    
    private let prefferedImageSize = CGSize(width: 60.0, height: 60.0)
    
    lazy var accountImageView: LoadableImageView = {
        let imageView = LoadableImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var accountTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dimView: UIView = {
        let view = UIView()
        view.backgroundColor = R.SearchAccount.dimViewBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constructHierarchy()
        activateDimViewConstraints()
        activateAccountImageViewConstraints()
        activateAccountTitleLabelConstraints()
        setupCardStyle()
        backgroundColor = R.SearchAccount.accountCellBackgroundColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        accountTitleLabel.text = ""
        accountImageView.image = nil
    }
    
    func configure(with account: AccountResponse) {
        accountImageView.loadImage(from: account.avatarURLString) { (image) in
            let resizedImage = Helper.resizedImageWith(image: image, targetSize: self.prefferedImageSize)
            self.accountImageView.image = resizedImage
        }
        accountTitleLabel.text = account.personaname
    }
    
    func setupCardStyle() {
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}

extension UITableViewCell: ReusableView {}
