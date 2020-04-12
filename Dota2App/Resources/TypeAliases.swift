//
//  TypeAliases.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

typealias AccountsCompletion<Value: Decodable> = (Result<Value, Error>) -> Void
typealias WonLostStatisticCompletion = (Result<WonLostResponse, Error>) -> Void
typealias PlayerInfoCompletion = (Result<PlayerInfoResponse, Error>) -> Void
typealias RecentMatchesCompletion = (Result<[MatchResponse], Error>) -> Void
typealias PlayerDetailsCompletion = (PlayerDetails) -> Void
