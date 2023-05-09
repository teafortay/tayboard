//
//  KeyboardView.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 7/9/21.
// used this tutorial to make xib: https://iostutorialjunction.com/2020/04/how-to-create-custom-uiview-class-with-xib-in-swift-tutorial.html
//  Copyright © 2021 Taylor Shaw. All rights reserved.
//
// This file contains the KeyboardView class, which owns both keyboard xib files.
 

import UIKit

class KeyboardView: UIView {
    
    weak var kvc: KeyboardViewController?
    var nibName: String = "KeyboardView"
    var deleteTimer: Timer?
    var regularKeys: [UIButton] = []
    
    //MARK: the following variables are used to determine which keyboard to display
    enum keyboardType {
        case up
        case down
        case symbol
        case greek
    }
    
    var capsLock: Bool = false
    var keyboard: keyboardType = .up
    
    //MARK: initializers
    init(frame: CGRect, kvc: KeyboardViewController, nibPrefix: String) {
        self.kvc = kvc
        self.nibName = nibPrefix + nibName 
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        //other setup
        self.regularKeys = [keyA0, keyA1, keyA4, keyA5,
                            keyA6, keyA7, keyA8, keyA9,
                            keyB2, keyB3, keyB4, keyB5,
                            keyB6, keyB7, keyB8, keyB9, keyB10,
                            keyC2, keyC3, keyC4, keyC5,
                            keyC6, keyC7, keyC8, keyC9,
                            keyD3, keyD3, keyD4, keyD5,
                            keyD6, keyD7, keyD8, keyD9,keyD10]
        if nibName.starts(with: "Full") {
            self.regularKeys += [keyA2, keyA3,
                                keyB0, keyB1,
                                keyC0, keyC1,
                                keyD1, keyD2]
        }
        insertButtonTitles()
    }
    
    
    //MARK: special keys - outlet to insert titles
    @IBOutlet weak var globeKey: UIButton!
    @IBOutlet weak var backspaceKey: UIButton!
    @IBOutlet weak var enterKey: UIButton!
    @IBOutlet weak var shiftKey: UIButton!
    @IBOutlet weak var symKey: UIButton!
    @IBOutlet weak var spaceKey: UIButton!
    
    //MARK: regular keyboard keys
    @IBOutlet weak var keyA0: UIButton!
    @IBOutlet weak var keyA1: UIButton!
    @IBOutlet weak var keyA2: UIButton!
    @IBOutlet weak var keyA3: UIButton!
    @IBOutlet weak var keyA4: UIButton!
    @IBOutlet weak var keyA5: UIButton!
    @IBOutlet weak var keyA6: UIButton!
    @IBOutlet weak var keyA7: UIButton!
    @IBOutlet weak var keyA8: UIButton!
    @IBOutlet weak var keyA9: UIButton!
    
    @IBOutlet weak var keyB0: UIButton!
    @IBOutlet weak var keyB1: UIButton!
    @IBOutlet weak var keyB2: UIButton!
    @IBOutlet weak var keyB3: UIButton!
    @IBOutlet weak var keyB4: UIButton!
    @IBOutlet weak var keyB5: UIButton!
    @IBOutlet weak var keyB6: UIButton!
    @IBOutlet weak var keyB7: UIButton!
    @IBOutlet weak var keyB8: UIButton!
    @IBOutlet weak var keyB9: UIButton!
    @IBOutlet weak var keyB10: UIButton!
    
    @IBOutlet weak var keyC0: UIButton!
    @IBOutlet weak var keyC1: UIButton!
    @IBOutlet weak var keyC2: UIButton!
    @IBOutlet weak var keyC3: UIButton!
    @IBOutlet weak var keyC4: UIButton!
    @IBOutlet weak var keyC5: UIButton!
    @IBOutlet weak var keyC6: UIButton!
    @IBOutlet weak var keyC7: UIButton!
    @IBOutlet weak var keyC8: UIButton!
    @IBOutlet weak var keyC9: UIButton!
    
    @IBOutlet weak var keyD1: UIButton!
    @IBOutlet weak var keyD2: UIButton!
    @IBOutlet weak var keyD3: UIButton!
    @IBOutlet weak var keyD4: UIButton!
    @IBOutlet weak var keyD5: UIButton!
    @IBOutlet weak var keyD6: UIButton!
    @IBOutlet weak var keyD7: UIButton!
    @IBOutlet weak var keyD8: UIButton!
    @IBOutlet weak var keyD9: UIButton!
    @IBOutlet weak var keyD10: UIButton!
    
    
//    MARK: begin key press actions
    @IBAction func doubleTapSpace(_ sender: Any) {
        kvc?.doubleTapSpace(sender)
        //change to upKeys
        self.keyboard = .up
        updateButtonTitles()
    }

    @IBAction func doubleTapShift(_ sender: Any) {
        if keyboard != .symbol && keyboard != .greek {
            // begin caps lock
            capsLock = true
            shiftKey.setTitle(Constants.CAPS_LOCK, for: .normal )
            keyboard = .up
            updateButtonTitles()
        }
    }
    
    @IBAction func deleteKeyLongPress(sender: UILongPressGestureRecognizer) {
        //for reference:
        /*  po sender.view?.restorationIdentifier
         ▿ Optional<String>
         - some : "A10"
         */
        
        if deleteTimer == nil {
            deleteTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
                self.kvc?.textDocumentProxy.deleteBackward()
            })
        }
        
        if sender.state == .ended {
            deleteTimer?.invalidate()
            deleteTimer = nil
        }
    }
    
    @IBAction func shiftKeyPress(_ sender: Any) {
        // touch down
        capsLock = false
        switch keyboard {
        case .up:
            keyboard = .down
        case .down:
            keyboard = .up
        case .symbol:
            keyboard = .greek
        case .greek:
            keyboard = .symbol
        }
        updateButtonTitles()
    }
    
    @IBAction func symKeyPress(_ sender: Any) {
        switch keyboard {
        case .up:
            keyboard = .symbol
        case .down:
            keyboard = .symbol
        case .symbol:
            keyboard = .up
        case .greek:
            keyboard = .up
        }
        updateButtonTitles()
    }
    
    @IBAction func keysPress(_ sender: Any) {
        kvc?.didTapButton(sender)
        if !capsLock {
            keyboard = .down
        }
            updateButtonTitles()
        
      
    }
    
    func insertButtonTitles() {
        let allKeys: [UIButton] = regularKeys + [globeKey, backspaceKey, enterKey, shiftKey, symKey, spaceKey]
        let myFont = UIFont.systemFont(ofSize: 24.0)
        
        let _ = allKeys.map({$0.titleLabel?.font = myFont})
        let _ = allKeys.map({$0.titleLabel?.adjustsFontSizeToFitWidth = true})
        let _ = allKeys.map({$0.layer.cornerRadius = 6.0})
        let _ = allKeys.map({$0.layer.masksToBounds = true})
        
        self.globeKey.setTitle(Constants.GLOBE, for: .normal)
        self.backspaceKey.setTitle(Constants.DELETE, for: .normal)
        self.enterKey.setTitle(Constants.ENTER, for: .normal)
        self.spaceKey.setTitle(Constants.SPACE, for: .normal)
        
        self.shiftKey.setTitle(Constants.SHIFT_DOWN , for: .normal)
        let _ = regularKeys.map({$0.setTitle(KeysModel.upKeys[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
    }
    
    func updateButtonTitles() {
        switch keyboard {
        case .up:
            if !capsLock {
                shiftKey.setTitle(Constants.SHIFT_DOWN, for: .normal)
            }
            symKey.setTitle(Constants.SYMBOL_KEY, for: .normal)
            let _ = regularKeys.map({$0.setTitle(KeysModel.upKeys[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
            
        case .down:
            shiftKey.setTitle(Constants.SHIFT_UP, for: .normal )
            symKey.setTitle(Constants.SYMBOL_KEY, for: .normal)
            let _ = regularKeys.map({$0.setTitle(KeysModel.downKeys[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
        case .symbol:
            shiftKey.setTitle(Constants.GREEK, for: .normal)
            symKey.setTitle(Constants.ABC, for: .normal)
            let _ = regularKeys.map({$0.setTitle(KeysModel.symKeys[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
        case .greek:
            shiftKey.setTitle(Constants.NUM, for: .normal)
            symKey.setTitle(Constants.ABC, for: .normal)
            let _ = regularKeys.map({$0.setTitle(KeysModel.greekKeys[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
        }
    }
    
   

}
