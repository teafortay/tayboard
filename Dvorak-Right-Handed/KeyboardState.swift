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
    var settings: [Setting] = [enableCaps, periodShortcut, haptics, keyboardClicks]
    
}

struct Setting {
    let name: String
    let detail: String?
    var value: Bool
}

//settings
var enableCaps = Setting(name: "Enable caps lock", detail: nil, value: true)
var periodShortcut =  Setting(name: "\".\" shortcut", detail: "Double tap Space to insert a .", value: true)
var haptics = Setting(name: "Haptics", detail: "You also need to 'Enable Full Access' for this to work", value: false)
var keyboardClicks = Setting(name: "Keyboard clicks", detail: "You also need to 'Enable Full Access' for this to work", value: false)
//var autoCapitalization
//    var smartPunctuation: Bool
//    var autoCorrection: Bool
