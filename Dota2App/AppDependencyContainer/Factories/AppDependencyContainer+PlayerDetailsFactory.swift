//
//  AppDependencyContainer+PlayerDetailsFactory.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 27/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol PlayerDetailsFactory {
    func makePlayerDetailsViewController() -> PlayerDetailsViewController
}

extension AppDependencyContainer: PlayerDetailsFactory {
    func makePlayerDetailsViewController() -> PlayerDetailsViewController {
        return PlayerDetailsViewController(viewModel: makePlayerDetailsViewModel())
    }
    
    private func makePlayerDetailsViewModel() -> PlayerDetailsViewModel {
        return PlayerDetailsViewModel()
    }
    
    
}
