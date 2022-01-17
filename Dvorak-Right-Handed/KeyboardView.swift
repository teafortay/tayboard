//
//  KeyboardView.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 7/9/21.
// used this tutorial to make xib: https://iostutorialjunction.com/2020/04/how-to-create-custom-uiview-class-with-xib-in-swift-tutorial.html
//  Copyright © 2021 Taylor Shaw. All rights reserved.
//
/* This file contains the KeyboardView class, which owns both keyboard xib files.
 */

import UIKit

class KeyboardView: UIView {
    
    weak var kvc: KeyboardViewController?
    var nibName: String = "KeyboardView"
    var shift: Bool = false
    var symbols: Bool = false
    var delete: Bool = false
    var deleteTimer: Timer?
    var regularKeys: [UIButton] = []
    let myFont = UIFont.systemFont(ofSize: 24.0)
    
    //initializers
    init(frame: CGRect, kvc: KeyboardViewController, state: String) {
        self.kvc = kvc
        self.nibName = state + nibName 
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
    
    
    //special keys - outlet to insert titles
    @IBOutlet weak var globeKey: UIButton!
    @IBOutlet weak var backspaceKey: UIButton!
    @IBOutlet weak var enterKey: UIButton!
    @IBOutlet weak var shiftKey: UIButton!
    @IBOutlet weak var symKey: UIButton!
    
   //regular keyboard keys
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
    
    //begin key press actions
    @IBAction func doubleTapSpace(_ sender: Any) {
        //get rid of space added by 1st click
        kvc?.textDocumentProxy.deleteBackward()
        kvc?.textDocumentProxy.insertText(".")
    }

    @IBAction func deleteKeyLongPress(sender: UILongPressGestureRecognizer) {
     //for reference:
      /*  po sender.view?.restorationIdentifier
        ▿ Optional<String>
          - some : "A10"
        */
        
        delete = !delete
        if delete {
            deleteTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
                self.kvc?.textDocumentProxy.deleteBackward()
            })

        } else {
            //do I need to invalidate timer anywhere else?
            deleteTimer?.invalidate()
        }
    }
    //keep because might use when i implement TouchDown? taps
//    @IBAction func globeKeyPress(_ sender: Any) {
//        kvc?.advanceToNextInputMode()
//    }
//
//    @IBAction func backspaceKeyPress(_ sender: Any) {
//        kvc?.textDocumentProxy.deleteBackward()
//    }
//    @IBAction func enterKeyPree(_ sender: Any) {
//        kvc?.textDocumentProxy.insertText("\n")
//    }
    
    @IBAction func shiftKeyPress(_ sender: Any) {

        if !symbols {
            
            shift = !shift
            if shift {
                self.shiftKey.setTitle("⇩" , for: .normal)
                let _ = regularKeys.map({$0.setTitle(Keys.upKeys[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
            } else {
                self.shiftKey.setTitle("⇧" , for: .normal)
                let _ = regularKeys.map({$0.setTitle(Keys.downKeys[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
            }
        } else { //on symbol keyboard
            kvc?.didTapButton(sender) //FIX
        }
    }
    
    @IBAction func symKeyPress(_ sender: Any) {
        
        //TODO: refactor
        let keys: [UIButton] = regularKeys + [shiftKey] //FIX
        symbols = !symbols
        if symbols {
            self.symKey.setTitle("ABC" , for: .normal)
            if self.nibName.starts(with: "Full") {
                let _ = keys.map({$0.setTitle(Keys.symKeysFull[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
            } else { //condensed
                let _ = keys.map({$0.setTitle(Keys.symKeysCondensed[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
            }
        } else { // symbols == false
            let _ = keys.map({$0.setTitle(Keys.downKeys[($0.restorationIdentifier ?? "☂︎")], for: .normal)})
            self.symKey.setTitle("+=\\" , for: .normal)
            self.shiftKey.setTitle("⇧" , for: .normal)
        }
    }
    
    @IBAction func keysPress(_ sender: Any) {
        kvc?.didTapButton(sender)
    }
    
    func insertButtonTitles() {
        let allKeys: [UIButton] = regularKeys + [globeKey, backspaceKey, enterKey, shiftKey, symKey]
        let _ = allKeys.map({$0.titleLabel?.font = myFont})
        self.globeKey.setTitle("🌐", for: .normal)
        self.backspaceKey.setTitle("⌫", for: .normal)
        self.enterKey.setTitle("enter", for: .normal)
        self.shiftKey.setTitle("⇧" , for: .normal)
    }
    
   

}
