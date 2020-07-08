//
//  Macro.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 7/6/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

import Foundation

public struct Macro {
    var name: String
    var signature: String
    
    init(name: String, signature: String) {
        self.name = name
        self.signature = signature
    }
    
    init(signature: String) {
        self.name = "Custom Macro"
        self.signature = signature
    }
    
    init(name: String) {
        self.name = name
        self.signature = "1d20+0"
    }
    
    init() {
        self.name = "Flat Roll"
        self.signature = "1d20+0"
    }
}
