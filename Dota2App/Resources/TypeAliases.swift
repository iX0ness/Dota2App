//
//  TypeAliases.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

typealias AccountsCompletion<Value: Decodable> = (Result<Value, Error>) -> Void
typealias PlayerInfoResult = (Result<PlayerInfoResponse, Error>) -> Void
typealias WonLostStatisticResult = (Result<WonLostResponse, Error>) -> Void
typealias RecentMatchesResult = (Result<[MatchResponse], Error>) -> Void
typealias HeroesCompletion = (Result<[HeroResponse], Error>) -> Void

typealias PlayerInfoCompletion = (PlayerInfoResponse) -> Void
typealias WonLostStatisticCompletion = (WonLostResponse) -> Void
typealias RecentMatchesCompletion = ([MatchResponse]) -> Void



