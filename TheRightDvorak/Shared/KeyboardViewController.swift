
//  KeyboardViewController.swift
//  taylorDvor
//
//  Created by Taylor Shaw on 1/22/18.
//  Copyright © 2018 Taylor Shaw. All rights reserved.
//

import UIKit
import AudioToolbox

class KeyboardViewController: UIInputViewController {
    
    var keyboardView: UIView?
    private var hapticManager: HapticManager?
    var keyboardHeightConstraint: NSLayoutConstraint?
    var state: KeyboardState = .init()
    var nibPrefix: String = "Full"
    
    
    //MARK: override functions
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hapticManager = nil
        keyboardHeightConstraint = nil
        keyboardView = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if hasFullAccess {
            hapticManager = HapticManager()
        }
        state.settings = settingsFromUserDefauts()
        
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
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    
    // MARK: custom functions
    
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
                rectHeight = screen.height * 0.33
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
        rectWidth = self.view.bounds.size.width
        if rectWidth == 0.0 {
            rectWidth = screen.width
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: rectWidth, height: rectHeight)
        return rect
    }
    
    func settingsFromUserDefauts() -> Settings {
        var newSettings = state.settings
        if UserDefaults.standard.bool(forKey: Constants.hasUserDefaults) {
            newSettings.enableCapsLock.value = UserDefaults.standard.bool(forKey: Constants.enableCaps)
            newSettings.periodShortcut.value = UserDefaults.standard.bool(forKey: Constants.periodShortcut)
            newSettings.haptics.value = UserDefaults.standard.bool(forKey: Constants.haptics)
            newSettings.sound.value = UserDefaults.standard.bool(forKey: Constants.sound)
        }
        return newSettings
    }
    
    func configureUserDefaults(from: Settings) {
        UserDefaults.standard.setValue(true, forKey: Constants.hasUserDefaults)
        //enable caps lock
        UserDefaults.standard.removeObject(forKey: Constants.enableCaps)
        if from.enableCapsLock.value {
            UserDefaults.standard.setValue(true, forKey: Constants.enableCaps)
        }
        //periodShortcut
        UserDefaults.standard.removeObject(forKey: Constants.periodShortcut)
        if from.periodShortcut.value {
            UserDefaults.standard.setValue(true, forKey: Constants.periodShortcut)
        }
        // haptics
        UserDefaults.standard.removeObject(forKey: Constants.haptics)
        if from.haptics.value {
            UserDefaults.standard.setValue(true, forKey: Constants.haptics)
        }
        // sound
        UserDefaults.standard.removeObject(forKey: Constants.sound)
        if from.sound.value {
            UserDefaults.standard.setValue(true, forKey: Constants.sound)
        }
    }
        func trySoundAndHaptics() {
            if state.settings.haptics.value {
                hapticManager?.playTapHaptic()
            }
            if state.settings.sound.value {
                AudioServicesPlaySystemSound(1104)
            }
        }
    
    func doubleTapSpace(_ sender: Any) {
        trySoundAndHaptics()
        if state.settings.periodShortcut.value {
            //get rid of space added by 1st click
            self.textDocumentProxy.deleteBackward()
            self.textDocumentProxy.insertText(".")
            //change to upKeys
            state.type = .up
        }
    }
    
    func doubleTapShift(_ sender: Any) {
        trySoundAndHaptics()
        if state.type != .symbol && state.type != .greek && state.settings.enableCapsLock.value {
            // begin caps lock
            state.capsLock = true
            state.type = .up
        }
    }
    
    func shiftKeyPress(_ sender: Any) {
        trySoundAndHaptics()
        state.capsLock = false
        switch state.type {
                case .up:
            state.type = .down
                case .down:
            state.type = .up
                case .symbol:
            state.type = .greek
                case .greek:
            state.type = .symbol
                }
    }
    
    func symKeyPress(_ sender: Any) {
        trySoundAndHaptics()
        switch state.type {
               case .up:
            state.type = .symbol
               case .down:
            state.type = .symbol
               case .symbol:
            state.type = .up
               case .greek:
            state.type = .up
               }
    }
    func goToSettings(_ sender: Any) {
        trySoundAndHaptics()
        let rect = getKeyboardRectFromBounds()
        self.keyboardView?.removeFromSuperview()
        self.keyboardView = nil
        let settingsView = SettingsView(
            frame: rect,
            settings: self.state.settings,
            callback: saveAndExitSettings(newSettings:)
        )
        self.view.addSubview(settingsView)
        self.keyboardView = settingsView
    }
    
    func saveAndExitSettings(newSettings: Settings) {
        trySoundAndHaptics()
        state.settings = newSettings
        configureUserDefaults(from: newSettings)
        let rect = getKeyboardRectFromBounds()
        self.keyboardView = nil
        self.keyboardView?.removeFromSuperview()
//        let keyboardView = KeyboardView(frame: rect, kvc: self, nibPrefix: nibPrefix)
//        self.view.addSubview(keyboardView)
//        self.keyboardView = keyboardView
    }
    
    func didTapButton(_ sender: Any) {
        trySoundAndHaptics()
        if state.type == .up && !state.capsLock {
            state.type = .down
                }
        if let button = sender as? UIButton {
            if let title = button.title(for: .normal) {
                let proxy = textDocumentProxy as UITextDocumentProxy
                switch title {
                case Constants.DELETE :
                    proxy.deleteBackward()
                case Constants.ENTER :
                    proxy.insertText("\n")
                case Constants.SPACE:
                    proxy.insertText(" ")
                case Constants.GLOBE :
                    self.advanceToNextInputMode()
                case "tab":
                    proxy.insertText("    ")
                default :
                    proxy.insertText(title)
                }
            }
        }
    }
    
}//end class

