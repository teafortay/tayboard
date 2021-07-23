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
    // let proxy = textDocumentProxy as UITextDocumentProxy
    weak var kvc: KeyboardViewController?
    
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
    
    @IBOutlet weak var globeKey: UIButton!
    @IBOutlet weak var backspaceKey: UIButton!
    @IBOutlet weak var enterKey: UIButton!
    
    @IBAction func globeKeyPress(_ sender: Any) {
        kvc?.advanceToNextInputMode()
    }
    
    @IBAction func backspaceKeyPress(_ sender: Any) {
        kvc?.textDocumentProxy.deleteBackward()
    }
    @IBAction func enterKeyPree(_ sender: Any) {
        kvc?.textDocumentProxy.insertText("\n")
    }
    
    func insertButtonTitles() {
        self.globeKey.setTitle("🌐", for: .normal)
        self.backspaceKey.setTitle("⌫", for: .normal)
        self.enterKey.setTitle("⏎", for: .normal)
    }
    /*
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var key1: UIButton!
   
     @IBAction func key1Press(_ sender: Any) {
       // print("pressed")
        proxy!.insertText("A")
        
     }
    */
   

}
