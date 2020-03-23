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
    var onReuse: (() -> Void) = {}

    lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var accountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var accountDetailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [accountImageView, accountTitleLabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constructHierarchy()
        activateAccountDetailsStackViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        accountImageView.image = nil
        accountImageView.cancelImageLoad()
    }
    
    func configure(with account: AccountResponse) {
        let accountAvatarURL = URL(string: account.avatarfull)!
        accountImageView.loadImage(at: accountAvatarURL, with: .custom(size: CGSize(width: 60.0, height: 60.0)))
        accountTitleLabel.text = account.personaname
    }
}

extension UITableViewCell: ReusableView {}
