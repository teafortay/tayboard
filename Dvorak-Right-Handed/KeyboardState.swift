//
//  KeyboardState.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 12/28/23.
//  Copyright © 2023 Taylor Shaw. All rights reserved.
//

import Foundation

enum KeyboardType {
    case up
    case down
    case symbol
    case greek
}

struct KeyboardState {
    var type: KeyboardType = .up
    var capsLock: Bool = false
    var enableCapslock: Bool = true
    var periodShortcut: Bool = true
    var autoCapitalization: Bool = true
//    var smartPunctuation: Bool
//    var autoCorrection: Bool
    
    
}
