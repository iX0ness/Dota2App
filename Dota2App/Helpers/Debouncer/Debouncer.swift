//
//  Throttle.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 13/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//


import Foundation

public class Debouncer {
    private let delay: TimeInterval
    private var workItem: DispatchWorkItem?

    public init(delay: TimeInterval) {
        self.delay = delay
    }

    /// Trigger the action after some delay
    public func run(action: @escaping () -> Void) {
        workItem?.cancel()
        workItem = DispatchWorkItem(block: action)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: workItem!)
    }
}
