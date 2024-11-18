//
//  RightKeyboardViewController.swift
//  TheRightDvorak
//
//  Created by Taylor Shaw on 10/10/24.
//  Copyright © 2024 Taylor Shaw. All rights reserved.
//

import Foundation
import UIKit

class RightKeyboardViewController: KeyboardViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = super.getKeyboardRectFromBounds()
        let screen = UIScreen.main.bounds
        let size = max(screen.width, screen.height)
        if size > 1000 {
            nibPrefix = "Full"
        } else {
            nibPrefix = "Right"
        }
        let keyboardView = KeyboardView(frame: rect, kvc: self, nibPrefix: nibPrefix, keyTitles: rightKeyTitles)
        self.view.addSubview(keyboardView)
        self.keyboardView = keyboardView
    }
}
