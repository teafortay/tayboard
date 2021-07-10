//
//  KeyboardView.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 7/9/21.
//  Copyright © 2021 Taylor Shaw. All rights reserved.
//

import UIKit

class KeyboardView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var key1: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
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



}
