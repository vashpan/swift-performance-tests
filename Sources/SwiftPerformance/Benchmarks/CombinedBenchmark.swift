//
//  CombinedBenchmark.swift
//  SwiftPerformance
//
//  Created by Konrad Kołakowski on 28/02/2023.
//  Copyright © 2023 One Minute Games. All rights reserved.
//

//
//  A combined benchmark that shows if we need to do some work by combining multiple
//  higher-order functions
//

public final class CombinedBenchmark: Benchmark {
    private struct MiniPerson {
        let name: String
        let age: Int
    }

    public let description: String = "Test filter-map-reduce"

    public let iterations: Int = 2
    public let expectedResult: Int = 226687821

    public func runAsBoomer(data: [Person]) -> Int {
        var result: Int = 0

        var miniPersons = [MiniPerson]()
        for p in data {
            if p.age >= 18 && p.age < 65 {
                let mp = MiniPerson(name: "\(p.name) \(p.surname)", age: p.age)
                result += p.age
                miniPersons.append(mp)
            }
        }

        return result
    }

    public func runAsZoomer(data: [Person]) -> Int {
        let result = data.filter { $0.age >= 18 && $0.age < 65 }
                              .map { MiniPerson(name: "\($0.name) \($0.surname)", age: $0.age) }
                              .reduce(0) { $0 + $1.age }
        
        return result
    }
}