//
//  SeedableRandomGenerator.swift
//  SwiftPerformance
//
//  Created by Konrad Kołakowski on 26/02/2023.
//  Copyright © 2023 One Minute Games. All rights reserved.
//

import Foundation

/// Seedable random generator based on ARC4Random algorithm.
///
/// Implementation took from here: https://stackoverflow.com/a/64897775 originally based
/// on this: https://github.com/apple/swift/blob/bc8f9e61d333b8f7a625f74d48ef0b554726e349/stdlib/public/TensorFlow/Random.swift
/// code from TensorFlow package for Swift.
public struct SeedableRandomGenerator: RandomNumberGenerator {
    // MARK: Properties
    private var state: [UInt8] = Array(0...255)
    private var iPos: UInt8 = 0
    private var jPos: UInt8 = 0

    // MARK: Initialization & overrides
    public init(seed: UInt64) {
        let bytesSeed = withUnsafeBytes(of: seed, Array.init)
        
        var j: UInt8 = 0
        for i: UInt8 in 0...255 {
            j &+= self.state(for: i) &+ bytesSeed[Int(i) % bytesSeed.count]
            self.swapAt(i, j)
        }
    }
    
    // Produce the next random UInt64 from the stream, and advance the internal
    // state.
    public mutating func next() -> UInt64 {
        var result: UInt64 = 0
        
        for _ in 0..<UInt64.bitWidth / UInt8.bitWidth {
            result <<= UInt8.bitWidth
            result += UInt64(self.nextByte())
        }

        return result
    }

    // MARK: Helpers
    
    // Helper to access the state.
    private func state(for index: UInt8) -> UInt8 {
        return state[Int(index)]
    }

    // Helper to swap elements of the state.
    private mutating func swapAt(_ i: UInt8, _ j: UInt8) {
        self.state.swapAt(Int(i), Int(j))
    }

    // Generates the next byte in the keystream.
    private mutating func nextByte() -> UInt8 {
        self.iPos &+= 1
        self.jPos &+= self.state(for: iPos)
        self.swapAt(iPos, jPos)
      
        return self.state(for: self.state(for: iPos) &+ self.state(for: jPos))
    }
}
