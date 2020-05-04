//
//  PlayerDetailView.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 26/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class PlayerDetailsView: UIView {
    
    let viewModel: PlayerDetailsViewModel
    
    var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var avatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name: "
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Country: "
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var wonCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Won: "
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lostCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Lost: "
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
        //label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var soloRankValueLabel: UILabel = {
        let label = UILabel()
        //label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFonts.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var teamRankValueLabel: UILabel = {
        let label = UILabel()
        //label.text = ""
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
    
    init(viewModel: PlayerDetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        constructHierarchy()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        activateHeaderViewConstraints()
        activateAvatarViewConstraints()
        activategeneralInfoStackViewConstraints()
        activateMMMRStackViewConstraints()
        activateRecentMatchesTableViewConstraints()
        
        roundAvatarImage()
        setHeaderGradient(view: headerView)
    }
    
    func bind() {
        viewModel.didProfileFetch = { [weak self] profile in
            guard let self = self else { return }
           
            DispatchQueue.main.async {
                self.nameLabel.text?.append(profile.name)
                self.countryLabel.text?.append(profile.country)
                self.mmrValueLabel.text = profile.mmr
                self.soloRankValueLabel.text = profile.soloRank
                self.teamRankValueLabel.text = profile.competitiveRank
            }
            
        }
        
        viewModel.didWonLostStatisticFetch = { [weak self] statistic in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.wonCountLabel.text?.append(statistic.won)
                self.lostCountLabel.text?.append(statistic.lost)
            }
        }
    }
}
