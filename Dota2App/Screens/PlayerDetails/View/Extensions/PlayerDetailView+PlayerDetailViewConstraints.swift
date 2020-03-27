//
//  PlayerDetailView+PlayerDetailViewConstraints.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 26/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol PlayerDetailsViewConstraints {
    func constructHierarchy()
    func activateHeaderViewConstraints()
    func activateAvatarViewConstraints()
    func activategeneralInfoStackViewConstraints()
    func activateMMMRStackViewConstraints()
    func activateRecentMatchesTableViewConstraints()
}

extension PlayerDetailsView: PlayerDetailsViewConstraints {
    
    
    func constructHierarchy() {
        addSubview(headerView)
        addSubview(recentMatchesTableView)
        headerView.addSubview(avatarView)
        headerView.addSubview(generalInfoStackView)
        headerView.addSubview(rankingStackView)
    }
    
    func activateHeaderViewConstraints() {
        let headerViewTopAnchor = headerView.topAnchor.constraint(equalTo: self.topAnchor)
        let headerViewLeadingAnchor = headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let headerViewTrailingAnchor = headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let headerViewHeightAnchor = headerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: R.PlayerDetails.headerViewHeightMultiplier)
        
        headerViewTopAnchor.isActive = true
        headerViewLeadingAnchor.isActive = true
        headerViewTrailingAnchor.isActive = true
        headerViewHeightAnchor.isActive = true
    }
    
    func activateAvatarViewConstraints() {
        let quaterViewWidth = self.frame.width / 5
        
        let avatarViewTopAnchor = avatarView.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor, constant: R.PlayerDetails.avatarViewTopAnchorConstant)
        let avatarViewCenterXAnchor = avatarView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: -quaterViewWidth)
        let avatarViewWidthAnchor = avatarView.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: R.PlayerDetails.avatarViewWidthAnchorMultiplier)
        let avatarViewHeightAnchor = avatarView.heightAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: R.PlayerDetails.avatarViewWidthAnchorMultiplier)
        
        avatarViewTopAnchor.isActive = true
        avatarViewCenterXAnchor.isActive = true
        avatarViewWidthAnchor.isActive = true
        avatarViewHeightAnchor.isActive = true
    }
    
    func activategeneralInfoStackViewConstraints() {
        NSLayoutConstraint.activate([
            generalInfoStackView.topAnchor.constraint(equalTo: avatarView.topAnchor),
            generalInfoStackView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 30),
            generalInfoStackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            generalInfoStackView.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor)
        ])
    }
    
    func activateMMMRStackViewConstraints() {
        NSLayoutConstraint.activate([
            rankingStackView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 15),
            rankingStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            rankingStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            rankingStackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
        ])
    }
    
    func activateRecentMatchesTableViewConstraints() {
        let recentMatchesTableViewTopAnchor = recentMatchesTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor)
        let recentMatchesTableViewLeadingAnchor = recentMatchesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let recentMatchesTableViewBottomAnchor = recentMatchesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let recentMatchesTableViewTrailingAnchor = recentMatchesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        recentMatchesTableViewTopAnchor.isActive = true
        recentMatchesTableViewLeadingAnchor.isActive = true
        recentMatchesTableViewBottomAnchor.isActive = true
        recentMatchesTableViewTrailingAnchor.isActive = true
    }
    
}
