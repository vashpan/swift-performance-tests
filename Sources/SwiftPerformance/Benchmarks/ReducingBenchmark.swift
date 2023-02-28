//
//  ReducingBenchmark.swift
//  SwiftPerformance
//
//  Created by Konrad Kołakowski on 26/02/2023.
//  Copyright © 2023 One Minute Games. All rights reserved.
//

//
//  A common pattern when we combining some result
//

public final class ReducingBenchmark: Benchmark {
    public let description: String = "Test reducing"

    public let iterations: Int = 200
    public let expectedResult: Int = 430085787

    public func runAsBoomer(data: [Person]) -> Int {
        var result: Int = 0

        for p in data {
            result += p.age
        }

        return result
    }

    public func runAsZoomer(data: [Person]) -> Int {
        let result = data.reduce(0) { $0 + $1.age }
        
        return result
    }
}