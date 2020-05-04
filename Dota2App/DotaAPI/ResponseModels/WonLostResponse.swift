//
//  WonLostResponse.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 09/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

protocol WonLostRepresentable {
    func getWonLostModel() -> WonLostStatistic
}

struct WonLostResponse: Decodable {
    private let win: Int
    private let lose: Int
}

extension WonLostResponse: WonLostRepresentable {
    func getWonLostModel() -> WonLostStatistic {
        return WonLostStatistic(
            won: String(win),
            lost: String(lose)
        )
    }
}
