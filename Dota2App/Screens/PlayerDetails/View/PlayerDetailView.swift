//
//  PlayerDetailView.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 26/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class PlayerDetailView: UIView {
    
    var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var avatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var wonCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lostCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var generalInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, countryLabel, wonCountLabel, lostCountLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var rankingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mmrStackView, soloRankStackView, teamRankStackView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var mmrStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mmrTitleLabel, mmrValueLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var soloRankStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [soloRankTitleLabel, soloRankValueLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var teamRankStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [teamRankTitleLabel, teamRankValueLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var mmrTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "MMR"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFonts.headline
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var soloRankTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Solo Rank"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFonts.headline
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var teamRankTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Team Rank"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFonts.headline
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mmrValueLabel: UILabel = {
        let label = UILabel()
        label.text = "5640"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var soloRankValueLabel: UILabel = {
        let label = UILabel()
        label.text = "5640"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var teamRankValueLabel: UILabel = {
        let label = UILabel()
        label.text = "5640"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var recentMatchesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
