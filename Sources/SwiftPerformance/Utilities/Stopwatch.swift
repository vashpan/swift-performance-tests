//
//  Stopwatch.swift
//  SwiftPerformance
//
//  Created by Konrad Kołakowski on 06/03/2022.
//  Copyright © 2023 One Minute Games. All rights reserved.
//

import Foundation
import QuartzCore

public final class Stopwatch {
    private var startTime: CFTimeInterval = 0.0
    public private(set) var isRunning = false

    public func start() {
        guard !self.isRunning else {
            return
        }

        self.startTime = CACurrentMediaTime()
    }

    public func stop() -> TimeInterval {
        // get time here to avoid any influence of "stop" function logic
        let stopTime = CACurrentMediaTime()
        let result = stopTime - self.startTime

        self.startTime = 0.0
        self.isRunning = false

        return result
    }
}
