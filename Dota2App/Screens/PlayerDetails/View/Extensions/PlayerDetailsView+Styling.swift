//
//  layerDetailsView+Styling.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 27/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit


extension PlayerDetailsView {
    func roundAvatarImage() {
        avatarView.layer.cornerRadius = avatarView.frame.size.width / 2
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.clipsToBounds = true
    }

    // Move to extension in future
    func setHeaderGradient(view: UIView) {
        let gradient = CAGradientLayer()
//        gradient.frame = view.frame
//        gradient.colors = [AppConstants.PlayerInfo.Styles.gradientColors.initColor.cgColor, AppConstants.PlayerInfo.Styles.gradientColors.endColor.cgColor]
//        gradient.startPoint = AppConstants.PlayerInfo.Styles.orientation.points().startPoint
//        gradient.endPoint = AppConstants.PlayerInfo.Styles.orientation.points().endPoint
        
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
        view.layoutIfNeeded()
    }
}


