//
//  PlayerDetailView.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 26/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class PlayerDetailsView: UIView {
    
    // MARK: - Object Properties
    
    let viewModel: PlayerDetailsViewModel
    
    // MARK: - View Properties
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.DotaColor.prussian
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var avatarView: LoadableImageView = {
        let imageView = LoadableImageView()
        imageView.image = UIImage(named: "account")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name: "
        label.textColor = .white
        label.font = UIFont.DotaFont.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Country: "
        label.textColor = .white
        label.font = UIFont.DotaFont.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var wonCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Won: "
        label.textColor = .white
        label.font = UIFont.DotaFont.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lostCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Lost: "
        label.textColor = .white
        label.font = UIFont.DotaFont.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var generalInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel,
            countryLabel,
            wonCountLabel,
            lostCountLabel,
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var rankingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            mmrStackView,
            soloRankStackView,
            teamRankStackView,
        ])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var mmrStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            mmrTitleLabel,
            mmrValueLabel,
        ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var soloRankStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            soloRankTitleLabel,
            soloRankValueLabel,
        ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var teamRankStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            teamRankTitleLabel,
            teamRankValueLabel,
        ])
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
        label.font = UIFont.DotaFont.headline
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var soloRankTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Solo Rank"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFont.headline
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var teamRankTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Team Rank"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFont.headline
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mmrValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFont.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var soloRankValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFont.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var teamRankValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.DotaFont.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var recentMatchesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = UIColor.DotaColor.midnight
        tableView.register(MatchTableViewCell.self, forCellReuseIdentifier: MatchTableViewCell.defaultReuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - View Lifecycle
    
    init(viewModel: PlayerDetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
        roundAvatarImage()
    }
    
    // MARK: - Object Methods
    
    private func bind() {
        
        viewModel.didProfileFetch = { [weak self] profile in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.avatarView.loadImage(from: profile.avatarURLString) { image in
                    self.avatarView.image = image
                }
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
    
    // MARK: - Setup View Hierarchy
    
    private func setupLayout() {
        addSubviews()
        activateConstraints()
        backgroundColor = .black
    }
    
    private func addSubviews() {
        addSubview(headerView)
        addSubview(recentMatchesTableView)
        headerView.addSubview(avatarView)
        headerView.addSubview(generalInfoStackView)
        headerView.addSubview(rankingStackView)
    }
    
    private func activateConstraints() {
        activateHeaderViewConstraints()
        activateAvatarViewConstraints()
        activategeneralInfoStackViewConstraints()
        activateMMMRStackViewConstraints()
        activateRecentMatchesTableViewConstraints()
    }
    
    private func activateHeaderViewConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: ViewMetrics.HeaderView.multiplierHeight),
        ])
    }
    
    private func activateAvatarViewConstraints() {
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor, constant: ViewMetrics.AvatarView.paddingTop),
            avatarView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: ViewMetrics.AvatarView.paddingXAxis),
            avatarView.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: ViewMetrics.AvatarView.multiplierWidth),
            avatarView.heightAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: ViewMetrics.AvatarView.multiplierHeight),
        ])
    }
    
    private func activategeneralInfoStackViewConstraints() {
        NSLayoutConstraint.activate([
            generalInfoStackView.topAnchor.constraint(equalTo: avatarView.topAnchor),
            generalInfoStackView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: ViewMetrics.GeneralInfoStackView.paddingLeading),
            generalInfoStackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: ViewMetrics.GeneralInfoStackView.paddingTrailing),
            generalInfoStackView.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor),
        ])
    }
    
    private func activateMMMRStackViewConstraints() {
        NSLayoutConstraint.activate([
            rankingStackView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: ViewMetrics.RankingStackView.paddingTop),
            rankingStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewMetrics.RankingStackView.paddingLeading),
            rankingStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewMetrics.RankingStackView.paddingTrailing),
            rankingStackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: ViewMetrics.RankingStackView.paddingBottom),
        ])
    }
    
    private func activateRecentMatchesTableViewConstraints() {
        NSLayoutConstraint.activate([
            recentMatchesTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            recentMatchesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recentMatchesTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            recentMatchesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func roundAvatarImage() {
        avatarView.layer.cornerRadius = avatarView.frame.size.width / 2
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.clipsToBounds = true
    }
    
    // MARK: - Constants
    
    private enum ViewMetrics {
        enum HeaderView {
            static let multiplierHeight: CGFloat = 0.4
        }
        
        enum AvatarView {
            static let paddingTop: CGFloat = 20
            static let multiplierWidth: CGFloat = 0.3
            static let multiplierHeight: CGFloat = 0.3
            static var paddingXAxis: CGFloat {
                return -UIScreen.main.bounds.width / 5
            }
        }
        
        enum GeneralInfoStackView {
            static let paddingLeading: CGFloat = 30
            static let paddingTrailing: CGFloat = -10
        }
        
        enum RankingStackView {
            static let paddingTop: CGFloat = 15
            static let paddingLeading: CGFloat = 30
            static let paddingTrailing: CGFloat = -30
            static let paddingBottom: CGFloat = -10
        }
    }
}
