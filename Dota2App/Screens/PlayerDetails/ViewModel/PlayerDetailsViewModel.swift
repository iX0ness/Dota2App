//
//  PlayerDetailsViewModel.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 27/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class PlayerDetailsViewModel {
    
    let playerDetailsProvider: PlayerDetailsServiceProvider
    var didFetchPlayerDetails: ((PlayerDetails) -> Void)?
    var playerDetails: PlayerDetails? {
        didSet {
            if let playerDetails = playerDetails {
                didFetchPlayerDetails?(playerDetails)
            }
        }
    }
    
    init(provider: PlayerDetailsServiceProvider) {
        playerDetailsProvider = provider
        getPlayerDetails()
    }
    
    func getPlayerDetails() {
        playerDetailsProvider.fetchPlayerDetails("1054954790") { (result) in
            self.playerDetails = result
        }
    }
}
