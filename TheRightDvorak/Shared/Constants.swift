//
//  CONSTANTS.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 1/18/22.
//  Copyright © 2022 Taylor Shaw. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let GLOBE = "🌐" //←⌨
    //Image(systemName: "globe")
    static let GEAR = "⚙"
    static let ENTER = "enter"
    static let DELETE = "⌫"
    static let SHIFT_UP = "⇧"
    static let CAPS_LOCK = "⇪"
    static let SHIFT_DOWN = "⇩"
    static let SYMBOL_KEY = "123"
    static let ABC = "ABC"
    static let NUM = "+="
    static let GREEK = "αβ"
    static let SPACE = "space"
    
    
    // settings view
    static let headerLabel = "Settings"
    static let close = "Close"
    
    // user defaults internal
    static let hasUserDefaults = "hasUserDefaults"
    static let enableCaps = "enableCaps"
    static let periodShortcut = "periodShortcut"
    static let haptics = "haptics"
    static let sound = "sound"
}

struct KeyTitles {
    var upKeys: [String: String]
    var downKeys: [String: String]
    var symKeys: [String: String]
    var greekKeys: [String: String]
}
