
//  KeyboardViewController.swift
//  taylorDvor
//
//  Created by Taylor Shaw on 1/22/18.
//  Copyright © 2018 Taylor Shaw. All rights reserved.
//

import UIKit


class KeyboardViewController: UIInputViewController {
    
@IBOutlet var nextKeyboardButton: UIButton!
    //change this
    let upKeyboard = UIView(frame: CGRect())
    let downKeyboard = UIView(frame: CGRect())
    let numKeyboard = UIView(frame: CGRect())
    
    
    override func updateViewConstraints() {
          super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        let heightConstraint = NSLayoutConstraint(item: self.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 300)
        self.view.addConstraint(heightConstraint)
        
        let upButtonTitles1 = ["!", "@", "#", "$", "J", "L", "M", "F", "P", "?", "⌫"]
        let upButtonTitles2 = ["%", "^", "Q", ">", "O", "R", "S", "U", "Y", "B", ":"]
        let upButtonTitles3 = ["&", "*", "Z", "A", "E", "H", "T", "D", "C", "K", "⏎"]
        let upButtonTitles4 = ["↧", "(", ")", "X", "<", "I", "N", "W", "V", "G", "\""]
        let upButtonTitles5 = ["123", "   SPACE   ", "🌐"]
        
        let row1 = createRowOfButtons(buttonTitles: upButtonTitles1 as [NSString])
        let row2 = createRowOfButtons(buttonTitles: upButtonTitles2 as [NSString])
        let row3 = createRowOfButtons(buttonTitles: upButtonTitles3 as [NSString])
        let row4 = createRowOfButtons(buttonTitles: upButtonTitles4 as [NSString])
        let row5 = createRowOfButtons(buttonTitles: upButtonTitles5 as [NSString])
        
        upKeyboard.addSubview(row1)
        upKeyboard.addSubview(row2)
        upKeyboard.addSubview(row3)
        upKeyboard.addSubview(row4)
        upKeyboard.addSubview(row5)
        
        self.view.addSubview(upKeyboard)
        
        row1.translatesAutoresizingMaskIntoConstraints = false
        row2.translatesAutoresizingMaskIntoConstraints = false
        row3.translatesAutoresizingMaskIntoConstraints = false
        row4.translatesAutoresizingMaskIntoConstraints = false
        row5.translatesAutoresizingMaskIntoConstraints = false
        
        upKeyboard.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsToInputView(inputView: self.view, rowViews: [row1, row2, row3, row4, row5])
        addKeyboardConstraints(keyboardView: upKeyboard)
        
       //down keyboard
        let downButtonTitles1 = ["1", "2", "3", "4", "j", "l", "m", "f", "p", "/", "⌫"]
        let downButtonTitles2 = ["5", "6", "q", ".", "o", "r", "s", "u", "y", "b", ";"]
        let downButtonTitles3 = ["7", "8", "z", "a", "e", "h", "t", "d", "c", "k", "⏎"]
        let downButtonTitles4 = ["↥", "9", "0", "x", ",", "i", "n", "w", "v", "g", "'"]
        let downButtonTitles5 = ["123", "   SPACE   ", "🌐"]

        
        let dRow1 = createRowOfButtons(buttonTitles: downButtonTitles1 as [NSString])
        let dRow2 = createRowOfButtons(buttonTitles: downButtonTitles2 as [NSString])
        let dRow3 = createRowOfButtons(buttonTitles: downButtonTitles3 as [NSString])
        let dRow4 = createRowOfButtons(buttonTitles: downButtonTitles4 as [NSString])
        let dRow5 = createRowOfButtons(buttonTitles: downButtonTitles5 as [NSString])
        
        downKeyboard.addSubview(dRow1)
        downKeyboard.addSubview(dRow2)
        downKeyboard.addSubview(dRow3)
        downKeyboard.addSubview(dRow4)
        downKeyboard.addSubview(dRow5)
        
        self.view.addSubview(downKeyboard)
        
        dRow1.translatesAutoresizingMaskIntoConstraints = false
        dRow2.translatesAutoresizingMaskIntoConstraints = false
        dRow3.translatesAutoresizingMaskIntoConstraints = false
        dRow4.translatesAutoresizingMaskIntoConstraints = false
        dRow5.translatesAutoresizingMaskIntoConstraints = false
        
        downKeyboard.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsToInputView(inputView: self.view, rowViews: [dRow1, dRow2, dRow3, dRow4, dRow5])
        addKeyboardConstraints(keyboardView: downKeyboard)
        
        //num keyboard
        let numButtonTitles1 = ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "⌫"]
        let numButtonTitles2 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        let numButtonTitles3 = ["~", "/", "[", "]", "{", "}", "\\", "|", "⏎"]
        let numButtonTitles4 = ["+", "=", "-", "_", ";", ":", "\"", "'"]
        let numButtonTitles5 = ["ABC", "   SPACE   ", "🌐"]
        
        let nRow1 = createRowOfButtons(buttonTitles: numButtonTitles1 as [NSString])
        let nRow2 = createRowOfButtons(buttonTitles: numButtonTitles2 as [NSString])
        let nRow3 = createRowOfButtons(buttonTitles: numButtonTitles3 as [NSString])
        let nRow4 = createRowOfButtons(buttonTitles: numButtonTitles4 as [NSString])
        let nRow5 = createRowOfButtons(buttonTitles: numButtonTitles5 as [NSString])
        
        numKeyboard.addSubview(nRow1)
        numKeyboard.addSubview(nRow2)
        numKeyboard.addSubview(nRow3)
        numKeyboard.addSubview(nRow4)
        numKeyboard.addSubview(nRow5)
        
        self.view.addSubview(numKeyboard)
        
        nRow1.translatesAutoresizingMaskIntoConstraints = false
        nRow2.translatesAutoresizingMaskIntoConstraints = false
        nRow3.translatesAutoresizingMaskIntoConstraints = false
        nRow4.translatesAutoresizingMaskIntoConstraints = false
        nRow5.translatesAutoresizingMaskIntoConstraints = false
        numKeyboard.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsToInputView(inputView: self.view, rowViews: [nRow1, nRow2, nRow3, nRow4, nRow5])
        addKeyboardConstraints(keyboardView: numKeyboard)
        
        self.numKeyboard.isHidden = true
        self.downKeyboard.isHidden = true
        self.upKeyboard.isHidden = false
        //end keyboard

        self.nextKeyboardButton = UIButton(type: .system)
 
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.nextKeyboardButton.isHidden = true
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
        
//        let textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
       // self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    //start keyboard
    func createButtonWithTitle(title: String) -> UIButton {
        
        let button = UIButton(type: .system) as UIButton
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 40)
        button.setTitle(title, for: UIControl.State.normal)
//        button.sizeToFit()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }
    
    @objc func didTapButton(_ sender: AnyObject?) {
        
        if let button = sender as? UIButton {
            if let title = button.title(for: .normal) {
                let proxy = textDocumentProxy as UITextDocumentProxy
                switch title {
                case "⌫" :
//
                    proxy.deleteBackward()
                case "⏎" :
//
                    proxy.insertText("\n")
                case "↥" :
                    downKeyboard.isHidden = true
                    upKeyboard.isHidden = false
                case "↧":
                    upKeyboard.isHidden = true
                    downKeyboard.isHidden = false
                    
                case "   SPACE   ":
                    proxy.insertText(" ")
                    
                case "123":
                    upKeyboard.isHidden = true
                    downKeyboard.isHidden = true
                    numKeyboard.isHidden = false
                    
                case "ABC":
                    numKeyboard.isHidden = true
                    upKeyboard.isHidden = false
                    
//                case "      " :
//                    proxy.insertText(" ")
                case "🌐" :
                    self.advanceToNextInputMode()
                case "tab":
                    proxy.insertText("    ")
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
            
            let topConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: mainView, attribute: .top, multiplier: 1.0, constant: 1)
            
            let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: mainView, attribute: .bottom, multiplier: 1, constant: -1)
            
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
                let widthConstraint = NSLayoutConstraint(item: firstButton, attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1.0, constant: 0)
                
                mainView.addConstraint(widthConstraint)
            }
            
            mainView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    func createRowOfButtons(buttonTitles: [NSString]) -> UIView {
        
        var buttons = [UIButton]()
        let keyboardRowView = UIView(frame: CGRect(x:0, y:0, width:350, height:350))
        
        for buttonTitle in buttonTitles{
            
            let button = createButtonWithTitle(title: buttonTitle as String)
            buttons.append(button)
            keyboardRowView.addSubview(button)
        }
        
        addIndividualButtonConstraints(buttons: buttons, mainView: keyboardRowView)
        
        return keyboardRowView
    }
    func addKeyboardConstraints(keyboardView: UIView){
        let topFrameConstraint = NSLayoutConstraint(item: keyboardView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
        let bottomFrameConstraint = NSLayoutConstraint(item: keyboardView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leftFrameConstraint = NSLayoutConstraint(item: keyboardView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0)
        let rightFrameConstraint = NSLayoutConstraint(item: keyboardView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0)
        self.view.addConstraints([topFrameConstraint, bottomFrameConstraint, leftFrameConstraint, rightFrameConstraint])
    }
    
    func addConstraintsToInputView(inputView: UIView, rowViews: [UIView]){
        
        for (index, rowView) in (rowViews.enumerated()) {
            let rightSideConstraint = NSLayoutConstraint(item: rowView, attribute: .right, relatedBy: .equal, toItem: inputView, attribute: .right, multiplier: 1.0, constant: -1)
            
            let leftConstraint = NSLayoutConstraint(item: rowView, attribute: .left, relatedBy: .equal, toItem: inputView, attribute: .left, multiplier: 1.0, constant: 1)
            
            inputView.addConstraints([leftConstraint, rightSideConstraint])
            
            var topConstraint: NSLayoutConstraint
            
            if index == 0 {
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: inputView, attribute: .top, multiplier: 1.0, constant: 0)
                
            }else{
                
                let prevRow = rowViews[index-1]
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: prevRow, attribute: .bottom, multiplier: 1.0, constant: 0)
                
                let firstRow = rowViews[0]
                let heightConstraint = NSLayoutConstraint(item: firstRow, attribute: .height, relatedBy: .equal, toItem: rowView, attribute: .height, multiplier: 1.0, constant: 0)
                
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
