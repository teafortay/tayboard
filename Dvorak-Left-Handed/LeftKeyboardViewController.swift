//
//  KeyboardViewController.swift
//  Dvorak-Left-Handed
//
//  Created by Taylor Shaw on 3/13/24.
//  Copyright © 2024 Taylor Shaw. All rights reserved.
//

import UIKit

class LeftKeyboardViewController: KeyboardViewController {
    
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
            nibPrefix = "Left"
        }
        let keyboardView = KeyboardView(frame: rect, kvc: self, nibPrefix: nibPrefix, keyTitles: leftKeyTitles)
        self.view.addSubview(keyboardView)
        self.keyboardView = keyboardView
    }
    
    override func saveAndExitSettings(newSettings: Settings) {
        super.saveAndExitSettings(newSettings: newSettings)
        let rect = super.getKeyboardRectFromBounds()
        let keyboardView = KeyboardView(frame: rect, kvc: self, nibPrefix: nibPrefix, keyTitles: leftKeyTitles)
                self.view.addSubview(keyboardView)
                self.keyboardView = keyboardView
    }
}
   
//        self.nextKeyboardButton = UIButton(type: .system)
//        
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
//        self.nextKeyboardButton.sizeToFit()
//        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
//        
//        self.view.addSubview(self.nextKeyboardButton)
//        
//        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    
