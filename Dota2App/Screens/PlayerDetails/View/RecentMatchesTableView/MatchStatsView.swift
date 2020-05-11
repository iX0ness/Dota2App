//
//  MatchStatsView.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 05/05/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol ResultSetable {
    func setResult(_ match_win: String)
    func setDuration(_ duration: String)
    func setKills(_ kills: String)
    func setDeaths(_ deaths: String)
    func setAssists(_ assists: String)
}

class MatchStatsView: UIView {
    
    private lazy var resultTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Result"
        label.font = UIFont.DotaFonts.headline
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resultValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.DotaFonts.body
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var durationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Duration"
        label.font = UIFont.DotaFonts.headline
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var durationValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.DotaFonts.body
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var killsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "K"
        label.font = UIFont.DotaFonts.headline
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var deathsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "D"
        label.font = UIFont.DotaFonts.headline
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var assistsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = UIFont.DotaFonts.headline
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var killsValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.DotaFonts.body
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var deathsValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.DotaFonts.body
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var assistsValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.DotaFonts.body
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playerStatsTitleLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [killsTitleLabel, deathsTitleLabel, assistsTitleLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var playerStatsValueLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [killsValueLabel, deathsValueLabel, assistsValueLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var playerStatsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [playerStatsTitleLabelsStackView, playerStatsValueLabelsStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var matchResultStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [resultTitleLabel, resultValueLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var matchDurationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [durationTitleLabel, durationValueLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var matchStatsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [matchResultStackView, matchDurationStackView, playerStatsStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        buildHierarchy()
        activateMatchStatsStackViewConstraints()
    }
    
    func buildHierarchy() {
        addSubview(matchStatsStackView)
    }
    
    func activateMatchStatsStackViewConstraints() {
        let matchStatsStackViewTopAnchor = matchStatsStackView.topAnchor.constraint(equalTo: topAnchor)
        let matchStatsStackViewLeadingAnchor = matchStatsStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let matchStatsStackViewBottomAnchor = matchStatsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        let matchStatsStackViewTrailingAnchor = matchStatsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        matchStatsStackViewTopAnchor.isActive = true
        matchStatsStackViewLeadingAnchor.isActive = true
        matchStatsStackViewBottomAnchor.isActive = true
        matchStatsStackViewTrailingAnchor.isActive = true
        
    }
    
}

extension MatchStatsView: ResultSetable {
    func setResult(_ didWinMatch: String) {
        resultValueLabel.text = didWinMatch
    }
    
    func setDuration(_ duration: String) {
        durationValueLabel.text = duration
    }
    
    func setKills(_ kills: String) {
        killsValueLabel.text = kills
    }
    
    func setDeaths(_ deaths: String) {
        deathsValueLabel.text = deaths
    }
    
    func setAssists(_ assists: String) {
        assistsValueLabel.text = assists
    }
    
}
