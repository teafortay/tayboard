//
//  KeyboardView.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 7/9/21.
// used this tutorial to make xib: https://iostutorialjunction.com/2020/04/how-to-create-custom-uiview-class-with-xib-in-swift-tutorial.html
//  Copyright © 2021 Taylor Shaw. All rights reserved.
//

import UIKit

class KeyboardView: UIView {
    weak var kvc: KeyboardViewController?
    var shift: Bool = false
    
    //initializers
    init(frame: CGRect, kvc: KeyboardViewController) {
        self.kvc = kvc
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("KeyboardView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        //other setup
        insertButtonTitles()
    }
    
    //special keys - outlet to insert titles
    @IBOutlet weak var globeKey: UIButton!
    @IBOutlet weak var backspaceKey: UIButton!
    @IBOutlet weak var enterKey: UIButton!
    @IBOutlet weak var shiftKey: UIButton!
    
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
        let regularKeys = [keyA0, keyA1, keyA2, keyA3, keyA4, keyA5, keyA6, keyA7, keyA8, keyA9,
                    keyB0, keyB1, keyB2, keyB3, keyB4, keyB5, keyB6, keyB7, keyB8, keyB9, keyB10,
                    keyC0, keyC1, keyC2, keyC3, keyC4, keyC5, keyC6, keyC7, keyC8, keyC9,
                    keyD1, keyD2, keyD3, keyD4, keyD5, keyD6, keyD7, keyD8, keyD9,keyD10]
        shift = !shift
        if shift{
            self.shiftKey.setTitle("↧" , for: .normal)
            let _ = regularKeys.map({$0?.setTitle(Keys.upKeys[($0?.restorationIdentifier ?? "≠")], for: .normal)})
//            self.keyA0.setTitle(Keys.upKeys[keyA0.restorationIdentifier!], for: .normal)
//            self.keyA1.setTitle(Keys.upKeys["A1"], for: .normal)
        } else {
            self.shiftKey.setTitle("↥" , for: .normal)
            let _ = regularKeys.map({$0?.setTitle(Keys.downKeys[($0?.restorationIdentifier ?? "≠")], for: .normal)})
//            self.keyA0.setTitle(Keys.downKeys["A0"], for: .normal)
//            self.keyA1.setTitle(Keys.downKeys["A1"], for: .normal)
        }
        
    }
    @IBAction func keysPress(_ sender: Any) {
        kvc?.didTapButton(sender)
    }
    func insertButtonTitles() {
        self.globeKey.setTitle("🌐", for: .normal)
        self.backspaceKey.setTitle("⌫", for: .normal)
        self.enterKey.setTitle("⏎", for: .normal)
        self.shiftKey.setTitle("↥" , for: .normal)
    }
    
   

}
