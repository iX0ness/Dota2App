//
//  UserDefaults+Extension.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 23/05/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

extension UserDefaults {
    func saveHoroes(_ heroes: [HeroResponse]) {
        do {
            let data = try JSONEncoder().encode(heroes)
            UserDefaults.standard.set(data, forKey: "heroes")
        } catch {
            print(error)
        }
    }
    
    func getHeroes() -> Result<[HeroResponse], Error>? {
        guard let data = UserDefaults.standard.data(forKey: "heroes") else { return nil }
        return Result { try JSONDecoder().decode([HeroResponse].self, from: data) }
    }
}
