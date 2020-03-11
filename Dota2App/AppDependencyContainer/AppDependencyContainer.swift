//
//  AppDependencyContainer.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

class AppDependencyContainer {
    
    private let apiFacade = APIFacade()
    
    
    func makeSearchAccountViewController() -> SearchAccountViewController {
        return SearchAccountViewController(viewModel: makeSearchAccountViewModel())
    }

    private func makeSearchAccountViewModel() -> SearchAccountViewModel {
        return SearchAccountViewModel(accountsProvider: apiFacade)
    }
    
}


