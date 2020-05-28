//
//  AccountTableViewCell.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    // MARK: - Object Properties
    private let prefferedImageSize = CGSize(width: 60.0, height: 60.0)
    
    // MARK: - View Properties
    
    private lazy var accountImageView: LoadableImageView = {
        let imageView = LoadableImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var accountTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dimView: UIView = {
        let view = UIView()
        view.backgroundColor = R.SearchAccount.dimViewBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    // MARK: - Object Methods
    
    func configure(with account: AccountResponse) {
        accountImageView.loadImage(from: account.avatarURLString) { (image) in
            let resizedImage = Helper.resizedImageWith(image: image, targetSize: self.prefferedImageSize)
            self.accountImageView.image = resizedImage
        }
        accountTitleLabel.text = account.personaname
    }
    
    private func setupCardStyle() {
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    // MARK: - Setup View Hierarchy
    
    private func setupLayout() {
        addSubviews()
        activateConstraints()
    }
    
    private func addSubviews() {
        addSubview(dimView)
        addSubview(accountImageView)
        addSubview(accountTitleLabel)
    }
    
    private func activateConstraints() {
        activateDimViewConstraints()
        activateAccountImageViewConstraints()
        activateAccountTitleLabelConstraints()
    }
    
    
    private func activateDimViewConstraints() {
        NSLayoutConstraint.activate([
            dimView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dimView.topAnchor.constraint(equalTo: topAnchor),
            dimView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dimView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func activateAccountImageViewConstraints() {
        NSLayoutConstraint.activate([
            accountImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            accountImageView.widthAnchor.constraint(equalToConstant: ViewMetrics.AccountImageView.width),
            accountImageView.heightAnchor.constraint(equalToConstant: ViewMetrics.AccountImageView.height),
            accountImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func activateAccountTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            accountTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: accountImageView.trailingAnchor, multiplier: ViewMetrics.AccountTitleLabel.multiplierLeading),
            accountTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            accountTitleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    // MARK: - Constants
    
    private enum ViewMetrics {
        enum AccountImageView {
            static let width: CGFloat = 60
            static let height: CGFloat = 60
        }
        
        enum AccountTitleLabel {
            static let multiplierLeading: CGFloat = 3.0
        }
    }
}

// MARK: - ReusableView

extension UITableViewCell: ReusableView {}
