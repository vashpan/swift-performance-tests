//
//  Main.swift
//  SwiftPerformance
//
//  Created by Konrad Kołakowski on 25/02/2023.
//  Copyright © 2022 One Minute Games. All rights reserved.
//

import Foundation

@main public struct App {
    // MARK: Properties
    private static let version = "1.0.0"

    private static let seed: UInt64 = 580340432343
    private static let sizeOfDatabase = 1_000_000
    private static let testIterations = 10_000

    private static let benchmarks: [any Benchmark] = [
        // todo: add some benchmarks here
    ]

    // MARK: Start app
    public static func main() {
        Self.writeBanner()

        var rng = SeedableRandomGenerator(seed: Self.seed)

        // generate some data
        write("Generating data... ")
        let persons = PersonsGenerator.generatePersons(amount: Self.sizeOfDatabase, rng: &rng)
        writeLine("Done!\n")

        // perform benchmarks
        writeLine("Performing \(Self.benchmarks.count) benchmarks...\n")

        let stopwatch = Stopwatch()
        for b in benchmarks {
            stopwatch.start()
            write(b.description + " (boomer)")
            let boomerResult = b.runAsBoomer(data: persons)
            let boomerTime = stopwatch.stop()
            writeLine("\t👴: \(Self.timeFormatted(boomerTime))")

            stopwatch.start()
            write(b.description + " (zoomer)")
            let zoomerResult = b.runAsZoomer(data: persons)
            let zoomerTime = stopwatch.stop()
            writeLine("\t👦: \(Self.timeFormatted(zoomerTime))")

            guard boomerResult == zoomerResult else {
                error("Unexpected result!")
                break
            }

            writeLine()
        }
    }

    // MARK: Helpers
    private static func writeBanner() {
        writeLine("Swift Performance Benchmarks \(Self.version)\n")
    }

    private static func timeFormatted(_ timeInterval: TimeInterval) -> String {
        return String(format: "%0.3f s", timeInterval)
    }

    private static func error(_ msg: String) {
        writeLine("Error: \(msg)")
        exit(1)
    }
}
