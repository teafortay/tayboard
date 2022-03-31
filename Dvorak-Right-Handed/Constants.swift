//
//  CONSTANTS.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 1/18/22.
//  Copyright © 2022 Taylor Shaw. All rights reserved.
//

import Foundation
import UIKit
import DeviceKit

struct Constants {
    //button titles
    static let GLOBE = "🌐"
    static let ESCAPE = "esc"
    static let ENTER = "enter"
    static let DELETE = "⌫"
    static let SHIFT_UP = "⇧"
    static let SHIFT_DOWN = "⇩"
    static let SYMBOL_KEY = "+=\\"
    static let ABC = "abc"
    static let NUM = "+="
    static let GREEK = "αβ"
    static let SPACE = "space"
    
    //devices
    static let devicesWithBuiltInGlobe: [Device] = [.iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax, Device.simulator(.iPhoneX),.simulator(.iPhoneXS),.simulator(.iPhoneXSMax),.simulator(.iPhoneXR),.iPhone11,.iPhone11Pro, .iPhone11ProMax, Device.simulator(.iPhone11),.simulator(.iPhone11Pro),.simulator(.iPhone11ProMax), .iPhone12,.iPhone12Pro,.iPhone12Mini,.iPhone12ProMax, Device.simulator(.iPhone12),.simulator(.iPhone12Pro),.simulator(.iPhone12Mini),.simulator(.iPhone12ProMax), .iPhone13,.iPhone13Pro,.iPhone13Mini,.iPhone13ProMax, Device.simulator(.iPhone13),.simulator(.iPhone13Pro),.simulator(.iPhone13Mini),.simulator(.iPhone13ProMax)]
}
