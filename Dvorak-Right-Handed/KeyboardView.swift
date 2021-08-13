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
        let regularKeys = [keyA0, keyA1]
        shift = !shift
        if shift{
            self.shiftKey.setTitle("↧" , for: .normal)
//            print(self.keyA0.restorationIdentifier!)
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
