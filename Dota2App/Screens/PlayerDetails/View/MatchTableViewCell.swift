//
//  MatchTableViewCell.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 05/05/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    // MARK: - View Properties
    
    private lazy var heroIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var heroNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var matchStatsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var matchStatsView: MatchStatsView = {
        let view = MatchStatsView(frame: .zero)
        view.placeInContainer(matchStatsContainerView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View Lifecycle
    
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
    
    // MARK: - Object Methods
    
    func configure(with match: Match) {
        heroIcon.image = UIImage(named: String(match.heroName))
        heroNameLabel.text = match.heroName
        matchStatsView.setResult(match.didWinMatch)
        matchStatsView.setDuration(match.duration)
        matchStatsView.setKills(match.kills)
        matchStatsView.setDeaths(match.deaths)
        matchStatsView.setAssists(match.assists)
    }
    
    // MARK: - Setup View Hierarchy
    
    private func setupLayout() {
        addSubviews()
        activateConstraints()
    }
    
    private func addSubviews() {
        addSubview(heroIcon)
        addSubview(heroNameLabel)
        addSubview(matchStatsContainerView)
    }
    
    private func activateConstraints() {
        activateHeroIconConstraints()
        activateHeroNameLabelConstraints()
        activateMatchStatsContainerViewConstraints()
    }
    
    private func activateHeroIconConstraints() {
        NSLayoutConstraint.activate([
            heroIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: ViewMetrics.HeroIcon.multiplierHeight),
            heroIcon.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            heroIcon.widthAnchor.constraint(equalTo: heightAnchor, multiplier: ViewMetrics.HeroIcon.multiplierWidth),
            heroIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func activateHeroNameLabelConstraints() {
        NSLayoutConstraint.activate([
            heroNameLabel.topAnchor.constraint(equalTo: heroIcon.bottomAnchor, constant: ViewMetrics.HeroNameLabel.paddingTop),
            heroNameLabel.widthAnchor.constraint(equalToConstant: ViewMetrics.HeroNameLabel.width),
            heroNameLabel.centerXAnchor.constraint(equalTo: heroIcon.centerXAnchor),
        ])
    }
    
    private func activateMatchStatsContainerViewConstraints() {
        NSLayoutConstraint.activate([
            matchStatsContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            matchStatsContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: ViewMetrics.MatchStatsContainerView.multiplierHeight),
            matchStatsContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewMetrics.MatchStatsContainerView.paddingTrailing),
            matchStatsContainerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: ViewMetrics.MatchStatsContainerView.multiplierWidth),
        ])
    }
    
    // MARK: - Constants
    
    private enum ViewMetrics {
        
        enum HeroIcon {
            static let multiplierHeight: CGFloat = 0.8
            static let multiplierWidth: CGFloat = 0.8
        }
        
        enum HeroNameLabel {
            static let paddingTop: CGFloat = -10
            static let width: CGFloat = 100
        }
        
        enum MatchStatsContainerView {
            static let multiplierHeight: CGFloat = 0.5
            static let paddingTrailing: CGFloat = -10
            static let multiplierWidth: CGFloat = 0.65
        }
        
    }
    
}
