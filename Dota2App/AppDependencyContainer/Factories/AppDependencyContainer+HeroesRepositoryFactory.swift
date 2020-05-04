//
//  AppDependencyContainer+HeroesRepositoryFactory.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 20/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol HeroesRepositoryFactory {
    var heroesRepository: HeroesRepository { get }
}


