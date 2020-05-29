//
//  AppDependencyContainer+PlayerDetailsFactory.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 27/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol PlayerDetailsFactory {
    func makePlayerDetailsViewController(with accountID: Int) -> PlayerDetailsViewController
}

extension AppDependencyContainer: PlayerDetailsFactory {
    func makePlayerDetailsViewController(with accountID: Int) -> PlayerDetailsViewController {
        return PlayerDetailsViewController(viewModel: makePlayerDetailsViewModel(accountID: accountID))
    }
    
    private func makePlayerDetailsViewModel(accountID: Int) -> PlayerDetailsViewModel {
        return PlayerDetailsViewModel(provider: apiFacade, accountID: accountID)
    }
}
