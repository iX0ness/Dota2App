//
//  EmptySearchAccountView.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 18/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class EmptySearchAccountView: UIView {
    
    // MARK: - Object Properties
    
    // MARK: - View Properties
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var dimView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.DotaColor.clarifier
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.DotaColor.charcoal
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    // MARK: - Object Methods
    
    private func setupLayout() {
        addSubviews()
        activateConstraints()
    }
    
    private func addSubviews() {
        addSubview(logoImageView)
        addSubview(dimView)
    }
    
    private func activateConstraints() {
        activateLogoImageViewConstraints()
        activateDimViewconstraints()
    }
    
    private func activateLogoImageViewConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: ViewMetrics.LogoImageView.width),
            logoImageView.heightAnchor.constraint(equalToConstant: ViewMetrics.LogoImageView.height),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    private func activateDimViewconstraints() {
        NSLayoutConstraint.activate([
            dimView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dimView.topAnchor.constraint(equalTo: topAnchor),
            dimView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dimView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: - Constants
    
    private enum ViewMetrics {
        enum LogoImageView {
            static let width: CGFloat = 150
            static let height: CGFloat = 150
        }
    }
    
}
