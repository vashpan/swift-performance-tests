//
//  FilteringBenchmark.swift
//  SwiftPerformance
//
//  Created by Konrad Kołakowski on 26/02/2023.
//  Copyright © 2023 One Minute Games. All rights reserved.
//

public final class FilteringBenchmark: Benchmark {
    public let description: String = "Test filtering"
    public let expectedResult: Int = 1849

    public func runAsBoomer(data: [Person]) -> Int {
        let nameToFind = "Piotrek Nowak"

        var numberOfPersonsFound = 0
        for p in data {
            let name = "\(p.name) \(p.surname)"
            if name == nameToFind {
                numberOfPersonsFound += 1
            }
        }

        return numberOfPersonsFound
    }

    public func runAsZoomer(data: [Person]) -> Int {
        return data.filter { "\($0.name) \($0.surname)" == "Piotrek Nowak" }.count
    }
}