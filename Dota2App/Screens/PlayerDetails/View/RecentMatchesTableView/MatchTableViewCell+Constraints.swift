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
        let imageViewSide = self.frame.height * 1.2
        
        let heroIconHeightAnchor = heroIcon.heightAnchor.constraint(equalToConstant: imageViewSide)
        let heroIconLeadingAnchor = heroIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        let heroIconWidthAnchor = heroIcon.widthAnchor.constraint(equalToConstant: imageViewSide)
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
