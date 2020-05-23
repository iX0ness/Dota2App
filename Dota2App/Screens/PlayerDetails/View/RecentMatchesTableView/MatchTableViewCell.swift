//
//  MatchTableViewCell.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 05/05/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    lazy var heroIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var heroNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var matchStatsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var matchStatsView: MatchStatsView = {
        let view = MatchStatsView(frame: .zero)
        view.placeInContainer(matchStatsContainerView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
        
    }
    
    func configure(with match: Match) {
        heroIcon.image = UIImage(named: String(match.heroName))
        heroNameLabel.text = match.heroName
        matchStatsView.setResult(match.didWinMatch)
        matchStatsView.setDuration(match.duration)
        matchStatsView.setKills(match.kills)
        matchStatsView.setDeaths(match.deaths)
        matchStatsView.setAssists(match.assists)
    }
    
    
}
