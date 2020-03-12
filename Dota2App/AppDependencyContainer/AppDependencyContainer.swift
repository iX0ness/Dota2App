//
//  AppDependencyContainer.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

class AppDependencyContainer {
    
    private lazy var apiFacade: APIFacade = {
        let facade = APIFacade(accountsService: makeAccountService())
        return facade
    }()
    
    func makeRootViewController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: makeSearchAccountViewController())
        return navigationController
    }
    
    private func makeSearchAccountViewController() -> SearchAccountViewController {
        return SearchAccountViewController(viewModel: makeSearchAccountViewModel(), factory: self)
    }
    
    private func makeSearchAccountViewModel() -> SearchAccountViewModel {
        return SearchAccountViewModel(accountsProvider: apiFacade)
    }
    
}


