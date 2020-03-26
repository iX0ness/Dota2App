//
//  PlayerDetailView+PlayerDetailViewConstraints.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 26/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol PlayerDetailViewConstraints {
    func constructHierarchy()
    func activatePlayerDetailViewConstraints()
}

extension PlayerDetailView: PlayerDetailViewConstraints {
    func constructHierarchy() {
        addSubview(headerView)
        addSubview(recentMatchesTableView)
        headerView.addSubview(avatarView)
        headerView.addSubview(generalInfoStackView)
        headerView.addSubview(rankingStackView)
    }
    
    func activatePlayerDetailViewConstraints() {
        
    }
    
    
}
