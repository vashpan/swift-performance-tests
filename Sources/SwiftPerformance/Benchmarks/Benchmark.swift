//
//  Benchmark.swift
//  SwiftPerformance
//
//  Created by Konrad Kołakowski on 26/02/2023.
//  Copyright © 2023 One Minute Games. All rights reserved.
//

public protocol Benchmark {
    var description: String { get }

    var iterations: Int { get }
    var expectedResult: Int { get }

    func runAsBoomer(data: [Person]) -> Int
    func runAsZoomer(data: [Person]) -> Int
}