//
//  ConsoleWriter.swift
//  SwiftPerformance
//
//  Created by Konrad Kołakowski on 26/02/2023.
//  Copyright © 2023 One Minute Games. All rights reserved.
//

//
// Provides some helper functions to handle printing in Swift with flushing
// helpful when 
//

import Foundation

internal func write(_ string: String) {
    print(string, terminator: "")
    fflush(stdout)
}

internal func writeLine(_ string: String = "") {
    print(string)
    fflush(stdout)
}
