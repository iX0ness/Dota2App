//
//  AppDependencyContainer+DebouncerFactory.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 23/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit


protocol DebouncerFactory {
    func makeDebouncer(delay: TimeInterval) -> Debouncer
}

extension AppDependencyContainer: DebouncerFactory {
    func makeDebouncer(delay: TimeInterval) -> Debouncer {
        return Debouncer(delay: delay)
    }
}
