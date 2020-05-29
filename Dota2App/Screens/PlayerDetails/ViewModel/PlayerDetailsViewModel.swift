//
//  PlayerDetailsViewModel.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 27/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class PlayerDetailsViewModel {
    
    // MARK: - Object properties
    
    private let playerDetailsProvider: PlayerDetailsServiceProvider
    private var didOccurError: Bool = false {
        willSet {
            if newValue != didOccurError {
                fetchErrorCallback?()
            }
        }
    }
    
    private var playerInfoResponse: PlayerInfoResponse? {
        didSet {
            if let playerInfo = playerInfoResponse {
                let profile = playerInfo.getProfileModel()
                didProfileFetch?(profile)
            } else {
                didOccurError = true
            }
        }
    }
    
    private var recentMatchesResponse: [MatchResponse] = [] {
        didSet {
            if !recentMatchesResponse.isEmpty {
                didRecentMatchesFetch?()
            } else {
                didOccurError = true
            }
        }
    }
    
    private var wonLostStatisticResponse: WonLostResponse? {
        didSet {
            if let wonLostStatistic = wonLostStatisticResponse {
                let wonLostStatisticModel = wonLostStatistic.getWonLostModel()
                didWonLostStatisticFetch?(wonLostStatisticModel)
            } else {
                didOccurError = true
            }
        }
    }
    
    var count: Int {
        return recentMatchesResponse.count
    }
    
    var didProfileFetch: ((Profile) -> Void)?
    var didRecentMatchesFetch: (() -> Void)?
    var didWonLostStatisticFetch: ((WonLostStatistic) -> Void)?
    var fetchErrorCallback: (() -> Void)?
    
    // MARK: - Object Lifecycle
    
    init(provider: PlayerDetailsServiceProvider, accountID: Int) {
        playerDetailsProvider = provider
        fetchPlayerDetails(with: String(accountID))
        
    }
    
    // MARK: - Object Methods
    
    func getMatch(at indexPath: IndexPath) -> Match {
        return recentMatchesResponse[indexPath.row].getMatchModel()
    }
    
    private func fetchPlayerDetails(with accountID: String) {
        playerDetailsProvider.fetchPlayerDetails(accountID,
                                                 playerInfoCompletion: { playerInfoResponse in
                                                    self.playerInfoResponse = playerInfoResponse
        },
                                                 wonLostStatisticCompletion: { wonLostResponse in
                                                    self.wonLostStatisticResponse = wonLostResponse
        },
                                                 recentMatchesCompletion: { recentMatchesResponse in
                                                    self.recentMatchesResponse = recentMatchesResponse
        })
    }
    
}
