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
        label.textColor = UIColor.white
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 34/255, alpha: 1.0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
