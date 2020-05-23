//
//  MatchTableViewCell+Constraints.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 05/05/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

extension MatchTableViewCell {
    
    func setupLayout() {
        buildHierarchy()
        activateConstraints()
    }
    
    private func buildHierarchy() {
        addSubview(heroIcon)
        addSubview(heroNameLabel)
        addSubview(matchStatsContainerView)
    }
    
    private func activateConstraints() {
        activateHeroIconConstraints()
        activateHeroNameLabelConstraints()
        activateMatchStatsContainerViewConstraints()
    }
    
    func activateHeroIconConstraints() {
        let heroIconHeightAnchor = heroIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        let heroIconLeadingAnchor = heroIcon.leadingAnchor.constraint(equalTo: leadingAnchor)
        let heroIconWidthAnchor = heroIcon.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        let heroIconCenterYAnchor = heroIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        
        heroIconHeightAnchor.isActive = true
        heroIconLeadingAnchor.isActive = true
        heroIconWidthAnchor.isActive = true
        heroIconCenterYAnchor.isActive = true
    }
    
    func activateHeroNameLabelConstraints() {
        let heroNameLabelTopAnchor = heroNameLabel.topAnchor.constraint(equalTo: heroIcon.bottomAnchor, constant: 3)
        let heroNameLabelWidthAnchor = heroNameLabel.widthAnchor.constraint(equalToConstant: 100)
        let heroNameLabelCenterXAnchor = heroNameLabel.centerXAnchor.constraint(equalTo: heroIcon.centerXAnchor)
        
        heroNameLabelTopAnchor.isActive = true
        heroNameLabelWidthAnchor.isActive = true
        heroNameLabelCenterXAnchor.isActive = true
        
    }
    
    func activateMatchStatsContainerViewConstraints() {
        let matchStatsContainerViewCenterYAnchor = matchStatsContainerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let matchStatsContainerViewHeightAnchor = matchStatsContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        let matchStatsContainerViewTrailingAnchor = matchStatsContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        let matchStatsContainerViewWidthAnchor = matchStatsContainerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65)

        matchStatsContainerViewCenterYAnchor.isActive = true
        matchStatsContainerViewHeightAnchor.isActive = true
        matchStatsContainerViewTrailingAnchor.isActive = true
        matchStatsContainerViewWidthAnchor.isActive = true
    }
}
