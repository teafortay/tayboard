
//  KeyboardViewController.swift
//  taylorDvor
//
//  Created by Taylor Shaw on 1/22/18.
//  Copyright © 2018 Taylor Shaw. All rights reserved.
//

import UIKit


class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        let buttonTitles1 = ["GLB", "J", "L", "M", "F", "P", "?", "BAK"]
        let buttonTitles2 = ["SHFT", "Q", ".", "O", "R", "S", "U", "Y", "B", "RET"]
        let buttonTitles3 = ["Z", "A", "E", "H", "T", "D", "C", "K"]
        let buttonTitles4 = ["X", ",", " ", "I", "N", "W", "V", "G"]
        
        let row1 = createRowOfButtons(buttonTitles: buttonTitles1 as [NSString])
        let row2 = createRowOfButtons(buttonTitles: buttonTitles2 as [NSString])
        let row3 = createRowOfButtons(buttonTitles: buttonTitles3 as [NSString])
        let row4 = createRowOfButtons(buttonTitles: buttonTitles4 as [NSString])
        
        self.view.addSubview(row1)
        self.view.addSubview(row2)
        self.view.addSubview(row3)
        self.view.addSubview(row4)
        
        row1.translatesAutoresizingMaskIntoConstraints = false
        row2.translatesAutoresizingMaskIntoConstraints = false
        row3.translatesAutoresizingMaskIntoConstraints = false
        row4.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsToInputView(inputView: self.view, rowViews: [row1, row2, row3, row4])
        //end

        self.nextKeyboardButton = UIButton(type: .system)
 
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    //start keyboard
    func createButtonWithTitle(title: String) -> UIButton {
        
        let button = UIButton(type: .system) as UIButton
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.setTitle(title, for: UIControlState.normal)
        button.sizeToFit()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }
    
    @objc func didTapButton(_ sender: AnyObject?) {
        
        if let button = sender as? UIButton {
            if let title = button.title(for: .normal) {
                var proxy = textDocumentProxy as UITextDocumentProxy
                proxy.insertText(title)
                proxy.deleteBackward()
                switch title {
                case "BAK" :
                    proxy.deleteBackward()
                    proxy.deleteBackward()
                    proxy.deleteBackward()
                case "RET" :
                    proxy.deleteBackward()
                    proxy.deleteBackward()
                    proxy.insertText("\n")
                    /*case "SHFT" :
                     proxy.deleteBackward()
                     proxy.deleteBackward()
                     proxy.deleteBackward()
                     proxy.deleteBackward()
                     proxy.localizedCapitalizedString*/
                    
                case "      " :
                    proxy.insertText(" ")
                case "GLB" :
                    self.advanceToNextInputMode()
                default :
                    proxy.insertText(title)
                }
            }
        }
    }
    /* @objc func didTapButton(sender: AnyObject?) {
     
     if let button = sender as? UIButton{
     if let title = button.title(for: .normal) {
     var proxy = textDocumentProxy as UITextDocumentProxy
     
     proxy.insertText(title)
     
     
     }}}*/
    func addIndividualButtonConstraints(buttons: [UIButton], mainView: UIView){
        
        for (index, button) in buttons.enumerated() {
            
            var topConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: mainView, attribute: .top, multiplier: 1.0, constant: 1)
            
            var bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: mainView, attribute: .bottom, multiplier: 1, constant: -1)
            
            var rightConstraint : NSLayoutConstraint!
            
            if index == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: mainView, attribute: .right, multiplier: 1.0, constant: -1)
                
            }else{
                
                let nextButton = buttons[index+1]
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: nextButton, attribute: .left, multiplier: 1.0, constant: -1)
            }
            
            
            var leftConstraint : NSLayoutConstraint!
            
            if index == 0 {
                
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: mainView, attribute: .left, multiplier: 1.0, constant: 1)
                
            }else{
                
                let prevtButton = buttons[index-1]
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: prevtButton, attribute: .right, multiplier: 1.0, constant: 1)
                
                let firstButton = buttons[0]
                var widthConstraint = NSLayoutConstraint(item: firstButton, attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1.0, constant: 0)
                
                mainView.addConstraint(widthConstraint)
            }
            
            mainView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    func createRowOfButtons(buttonTitles: [NSString]) -> UIView {
        
        var buttons = [UIButton]()
        var keyboardRowView = UIView(frame: CGRect(x:0, y:0, width:350, height:350))
        
        for buttonTitle in buttonTitles{
            
            let button = createButtonWithTitle(title: buttonTitle as String)
            buttons.append(button)
            keyboardRowView.addSubview(button)
        }
        
        addIndividualButtonConstraints(buttons: buttons, mainView: keyboardRowView)
        
        return keyboardRowView
    }
    func addConstraintsToInputView(inputView: UIView, rowViews: [UIView]){
        
        for (index, rowView) in (rowViews.enumerated()) {
            var rightSideConstraint = NSLayoutConstraint(item: rowView, attribute: .right, relatedBy: .equal, toItem: inputView, attribute: .right, multiplier: 1.0, constant: -1)
            
            var leftConstraint = NSLayoutConstraint(item: rowView, attribute: .left, relatedBy: .equal, toItem: inputView, attribute: .left, multiplier: 1.0, constant: 1)
            
            inputView.addConstraints([leftConstraint, rightSideConstraint])
            
            var topConstraint: NSLayoutConstraint
            
            if index == 0 {
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: inputView, attribute: .top, multiplier: 1.0, constant: 0)
                
            }else{
                
                let prevRow = rowViews[index-1]
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: prevRow, attribute: .bottom, multiplier: 1.0, constant: 0)
                
                let firstRow = rowViews[0]
                var heightConstraint = NSLayoutConstraint(item: firstRow, attribute: .height, relatedBy: .equal, toItem: rowView, attribute: .height, multiplier: 1.0, constant: 0)
                
                inputView.addConstraint(heightConstraint)
            }
            inputView.addConstraint(topConstraint)
            
            var bottomConstraint: NSLayoutConstraint
            
            if index == rowViews.count - 1 {
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal, toItem: inputView, attribute: .bottom, multiplier: 1.0, constant: 0)
                
            }else{
                
                let nextRow = rowViews[index+1]
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal, toItem: nextRow, attribute: .top, multiplier: 1.0, constant: 0)
            }
            
            inputView.addConstraint(bottomConstraint)
        }
        
    }
}
