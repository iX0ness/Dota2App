//
//  AppDependencyContainer+SearchControllerFactory.swift
//  Dota2App
//
//  Created by Levchuk Misha on 12/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

protocol SearchControllerFactory {
    func makeSearchController() -> UISearchController
}

extension AppDependencyContainer: SearchControllerFactory {
    func makeSearchController() -> UISearchController {
        return UISearchController()
    }
}
