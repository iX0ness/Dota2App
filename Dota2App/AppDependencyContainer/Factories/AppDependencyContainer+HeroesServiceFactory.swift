//
//  AppDependencyContainer+HeroesServiceFactory.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 17/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol HeroesRepositoryProvider {
    func makeHeroesRepository() -> HeroesRepository
}

extension AppDependencyContainer: HeroesRepositoryProvider {
    func makeHeroesRepository() -> HeroesRepository {
        return HeroesRepository(factory: self)
    }
}
