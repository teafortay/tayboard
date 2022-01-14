
//  KeyboardViewController.swift
//  taylorDvor
//
//  Created by Taylor Shaw on 1/22/18.
//  Copyright © 2018 Taylor Shaw. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var keyboardView: KeyboardView?
    var keyboardHeightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        //TODO: use viewwillload?
        super.viewDidLoad()
        // Perform custom UI setup here
        let rect = getKeyboardRectFromBounds()
        let keyboardView = KeyboardView(frame: rect, kvc: self, state: "Condensed")
        self.view.addSubview(keyboardView)
        self.keyboardView = keyboardView
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        //change priority of conflicting constraints
        if let index = self.view.constraints.firstIndex(where: {$0.identifier == "UIView-Encapsulated-Layout-Height"}) {
            let viewHeightConstraint = self.view.constraints[index]
            viewHeightConstraint.priority = UILayoutPriority(rawValue: 750)
        }
        // Add custom view sizing constraints
        let rect = getKeyboardRectFromBounds()
        if  let heightConstraint = self.keyboardHeightConstraint {
            heightConstraint.constant = rect.height
            
        } else {
            let keyboardHeightConstraint = NSLayoutConstraint(item: self.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: rect.height)
            self.view.addConstraint(keyboardHeightConstraint)
            self.keyboardHeightConstraint = keyboardHeightConstraint
        }
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let rect = getKeyboardRectFromBounds()
        keyboardView?.frame = rect
        keyboardHeightConstraint?.constant = rect.height
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let rect = getKeyboardRectFromBounds()
        keyboardView?.frame = rect
        keyboardHeightConstraint?.constant = rect.height
    }
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
//        let rect = getKeyboardRectFromBounds(from: "viewLayoutMarginsDidChange")
//        keyboardView?.frame = rect
//        keyboardHeightConstraint?.constant = rect.height
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }  
 
    
    override func textWillChange(_ textInput: UITextInput?) {
        super.textWillChange(textInput)
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        super.textDidChange(textInput)
    }
    
    
    func getKeyboardRectFromBounds() -> CGRect {
        let screen = UIScreen.main.bounds
        var rectHeight: CGFloat
        var rectWidth: CGFloat
        if screen.height < 500 {
            rectHeight = screen.height/2
        } else if screen.width < screen.height {
            //portrait
            if screen.height < 730 {
                //between 500 and 730
                rectHeight = CGFloat(250.0)
            } else {
                    // > 730
                    rectHeight = screen.height * 0.34
            }
        } else {
            //landscape
            if screen.height < 700 {
                rectHeight = screen.height/2
            } else {
                // > 700
                rectHeight = screen.height * 0.45
            }
        }
        //make width match safe area
//        print("screen: ", screen.height)
//        print("rect: ", rectHeight)
        rectWidth = self.view.bounds.size.width
        if rectWidth == 0.0 {
            rectWidth = screen.width
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: rectWidth, height: rectHeight)
        return rect
    }

    func didTapButton(_ sender: Any) {
        
        if let button = sender as? UIButton {
            if let title = button.title(for: .normal) {
                let proxy = textDocumentProxy as UITextDocumentProxy
                switch title {
                case "⌫" :
                    proxy.deleteBackward()
                case "⏎" :
                    proxy.insertText("\n")
                case "Space":
                    proxy.insertText(" ")
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

//end class
}
