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
    weak var proxy: UITextDocumentProxy?
    
    init(frame: CGRect, proxy: UITextDocumentProxy) {
        self.proxy = proxy
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
