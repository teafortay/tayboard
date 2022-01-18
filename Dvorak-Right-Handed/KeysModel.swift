//
//  Keys.swift later renamed KeysModel
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 8/12/21.
//  Copyright © 2021 Taylor Shaw. All rights reserved.
//
/* This file represents the Model in this MVC design pattern.
 Think of the keyboard as 4 rows with 11 buttons each. The buttons are labeled:
 A0...A10
 B0...B10
 C0...C10
 D0...D10
 All 44 buttons are not always displayed, for instance in the condensed keyboard.
 Each button is given a restoration id in the xib file. These ids correspond to the keys
 in the following dictionaries. The values correspond to the appropriate button titles.
 KeyboardView.swift then uses a map function to insert the appropriate title.
 */

import Foundation
import UIKit

struct KeysModel {
    static let upKeys = ["A0" : "!", "A1" : "@", "A2" : "#", "A3" : "$", "A4" : "J",
                         "A5" : "L", "A6" : "M", "A7" : "F", "A8" : "P", "A9" : "?",
                         "B0" : "%", "B1" : "^", "B2" : "Q", "B3" : ">", "B4" : "O",
                         "B5" : "R","B6" : "S", "B7" : "U", "B8" : "Y", "B9" : "B", "B10" : ":",
                         "C0" : "&", "C1" : "*", "C2" : "Z", "C3" : "A", "C4" : "E",
                         "C5" : "H", "C6" : "T", "C7" : "D", "C8" : "C", "C9" : "K",
                         "D1" : "(", "D2" : ")", "D3" : "X", "D4" : "<", "D5" : "I",
                         "D6" : "N", "D7" : "W", "D8" : "V", "D9" : "G", "D10" : "\""]
    
    
    static let downKeys = ["A0" : "1", "A1" : "2", "A2" : "3", "A3" : "4", "A4" : "j",
                           "A5" : "l", "A6" : "m", "A7" : "f", "A8" : "p", "A9" : "/",
                           "B0" : "5", "B1" : "6", "B2" : "q", "B3" : ".", "B4" : "o",
                           "B5" : "r","B6" : "s", "B7" : "u", "B8" : "y", "B9" : "b", "B10" : ";",
                           "C0" : "7", "C1" : "8", "C2" : "z", "C3" : "a", "C4" : "e",
                           "C5" : "h", "C6" : "t", "C7" : "d", "C8" : "c", "C9" : "k",
                           "D1" : "9", "D2" : "0", "D3" : "x", "D4" : ",", "D5" : "i",
                           "D6" : "n", "D7" : "w", "D8" : "v", "D9" : "g", "D10" : "'"]
    
    static let symKeysFull = ["A0" : "1", "A1" : "2", "A2" : "3", "A3" : "$", "A4" : "€",
                          "A5" : "¥", "A6" : "£", "A7" : "%", "A8" : "#", "A9" : "(",
                          "B0" : "4", "B1" : "5",  "B2" : "6", "B3" : "↔︎", "B4" : "=",
                          "B5" : "≈","B6" : "~", "B7" : "≠", "B8" : "*", "B9" : "[", "B10" : "]",
                          "C0" : "7", "C1" : "8", "C2" : "9", "C3" : "+", "C4" : "-",
                          "C5" : "×", "C6" : "÷", "C7" : "^", "C8" : "{", "C9" : "}",
                              "D0" : "≥", "D1" : "0", "D2" : "≤", "D3" : "\\", "D4" : "/",
                          "D5" : "|","D6" : "`", "D7" : "_", "D8" : "←", "D9" : "→", "D10" : ")"]
    
    static let symKeysCondensed = ["A0" : "1", "A1" : "2", "A4" : "3",
                                   "A5" : "+", "A6" : "\\", "A7" : "*", "A8" : "(", "A9" : ")",
                                    "B2" : "4", "B3" : "5", "B4" : "6",
                                   "B5" : "-","B6" : "_", "B7" : "$", "B8" : "[", "B9" : "]", "B10" : "&",
                                   "C2" : "7", "C3" : "8", "C4" : "9",
                                   "C5" : "#", "C6" : "%", "C7" : "@", "C8" : "{", "C9" : "}",
                                   "D0" : "<", "D3" : "0", "D4" : ">",
                                   "D5" : "*","D6" : "`", "D7" : "~", "D8" : "=", "D9" : "|", "D10" : "^"]
    
    //TODO: implement greek letter keyboard
    static let greekKeys = ["A0" : "α", "A1" : "β", "A2" : "γ", "A3" : "δ", "A4" : "ε",
                            "A5" : "ζ", "A6" : "η", "A7" : "θ", "A8" : "λ", "A9" : "μ",
                            "B0" : "π", "B1" : "ρ", "B2" : "σ", "B3" : "τ", "B4" : "φ",
                            "B5" : "χ","B6" : "ψ", "B7" : "ω", "B8" : "[", "B9" : "]", "B10" : "⊣",
                            "C0" : "7", "C1" : "8", "C2" : "9", "C3" : "¥", "C4" : "≈",
                            "C5" : "×", "C6" : "~", "C7" : "∪", "C8" : "{", "C9" : "}",
                            "D0" : "≥", "D1" : "0", "D2" : "≤", "D3" : "£", "D4" : "≠",
                            "D5" : "÷","D6" : "`", "D7" : "∩", "D8" : "←", "D9" : "→", "D10" : "↔︎"]
    
}
//αβγ
