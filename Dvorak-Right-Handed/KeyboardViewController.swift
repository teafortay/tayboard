
//  KeyboardViewController.swift
//  taylorDvor
//
//  Created by Taylor Shaw on 1/22/18.
//  Copyright © 2018 Taylor Shaw. All rights reserved.
//

import UIKit
import DeviceKit

class KeyboardViewController: UIInputViewController {
    
    var keyboardView: KeyboardView?
    var keyboardHeightConstraint: NSLayoutConstraint?
    
    let device = Device.current
//    print(device)
//    override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//            UIDevice.current.beginGeneratingDeviceOrientationNotifications()
//        }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//            UIDevice.current.endGeneratingDeviceOrientationNotifications()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        let nibPrefix: String
        var needGlobe: Bool = true
        let rect: CGRect = getKeyboardRectFromBounds()
        let screen: CGRect = UIScreen.main.bounds
        let size: CGFloat = max(screen.width, screen.height)
        if size > 1000 {
            nibPrefix = "Full"
        } else {
            nibPrefix = "Condensed"
        }
        if device.isOneOf(Constants.devicesWithBuiltInGlobe) {
            needGlobe = false
        }
        let keyboardView = KeyboardView(frame: rect, kvc: self, nibPrefix: nibPrefix, needGlobeKey: needGlobe)
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
        print("transitioning")
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
//        if UIDevice.current.orientation.isLandscape {
//                       print("Landscape")
//        } else if UIDevice.current.orientation.isPortrait {
//                       print("Portrait")
//        }
        
        //make width match safe area
        rectWidth = self.view.bounds.size.width
        if rectWidth == 0.0 {
            rectWidth = screen.width
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: rectWidth, height: rectHeight)
        return rect
    }
    
    func doubleTapSpace(_ sender: Any) {
        //get rid of space added by 1st click
        self.textDocumentProxy.deleteBackward()
        self.textDocumentProxy.insertText(".")
    }

    func didTapButton(_ sender: Any) {
        let proxy = textDocumentProxy as UITextDocumentProxy
//        if let button = sender as? UIButton {
        guard let button = sender as? UIButton else { return }
        guard let title = button.title(for: .normal) else { return }
                
        switch title {
        case Constants.DELETE :
            proxy.deleteBackward()
        case Constants.ENTER :
            proxy.insertText("\n")
        case Constants.SPACE:
            proxy.insertText(" ")
        case Constants.GLOBE:
            self.advanceToNextInputMode()
//          self.handleInputModeList(from: keyboardView!, with: UIEvent())
        case Constants.ESCAPE :
            self.dismissKeyboard()
        case "tab":
            proxy.insertText("    ")
        default :
            proxy.insertText(title)
        }
    }
    
    func didDragButton(_ sender: Any, shifted: Bool, symbols: Bool, greek: Bool) {
        let proxy = textDocumentProxy as UITextDocumentProxy
        var insertionText: String = "☂︎"
        guard let button = sender as? UIButton else { return }
        if let id = button.restorationIdentifier {
            if symbols {
                if greek { //on greek keyboard, alternative is symbols
                    insertionText = KeysModel.symKeys[id] ?? insertionText
                } else { // on symbol keyboard, alternative is greek
                    insertionText = KeysModel.greekKeys[id] ?? insertionText
                } //on regular keyboard
            } else if shifted {
                insertionText = KeysModel.downKeys[id] ?? insertionText
            } else {
                insertionText = KeysModel.upKeys[id] ?? insertionText
            }
        }
        
        proxy.insertText(insertionText)
    }

//end class
}
