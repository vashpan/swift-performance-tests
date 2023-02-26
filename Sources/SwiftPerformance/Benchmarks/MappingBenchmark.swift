//
//  MappingBenchmark.swift
//  SwiftPerformance
//
//  Created by Konrad Kołakowski on 26/02/2023.
//  Copyright © 2023 One Minute Games. All rights reserved.
//

public final class MappingBenchmark: Benchmark {
    // map all persons to a string

    public let description: String = "Test mapping"
    public let expectedResult: Int = 10_000_000

    public func runAsBoomer(data: [Person]) -> Int {
        var result: [String] = []

        for p in data {
            result.append("\(p.name) \(p.surname), \(p.age) years old")
        }

        return result.count
    }

    public func runAsZoomer(data: [Person]) -> Int {
        let result = data.map { "\($0.name) \($0.surname), \($0.age) years old" }
        
        return result.count
    }
}