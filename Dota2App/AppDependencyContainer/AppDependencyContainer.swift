//
//  AppDependencyContainer.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class AppDependencyContainer {
    
    lazy var apiFacade: APIFacade = {
        let facade = APIFacade(servicesProvider: self)
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


