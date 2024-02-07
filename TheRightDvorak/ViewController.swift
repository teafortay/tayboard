//
//  ViewController.swift
//  TheRightDvorak
//
//  Created by Taylor Shaw on 1/22/18.
//  Copyright © 2018 Taylor Shaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var privacyPolicy: UILabel!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            instructions.text = """
            How to use this keyboard:
             1. Open Settings
             2. Go to General > Keyboard > Keyboards
             3. Click "Add New Keyboard"
             4. Select "Right Dvorak"
             5. Congrats! You should now be able to access this keyboard on this device. Press the 🌐 key to switch between keyboards.
            """
            privacyPolicy.text = """
            Privacy Policy:
            Privacy is very important to us. Right Dvorak collects user information to provide user settings that remain unchanged
            when the user closes and reopens our keyboard. We do not share user data with anyone.
            User data is collected and stored locally on the device. We will update this document
            if our data collection changes in any way. Anyone can access this document, our privacy
            policy, by visiting our website: http://taylorcodeshop.com/theRightDvorak
            """
            let htmlString = "This is a <b>bold</b> text."
            let data = htmlString.data(using: .utf8)!
            let attributedString = try? NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil)
            privacyPolicy.attributedText = attributedString
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
//            UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
//            UIDevice.current.endGeneratingDeviceOrientationNotifications()
        }
        
        override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
//            if UIDevice.current.orientation.isLandscape {
//                print("Landscape")
//            } else {
//                print("Portrait")
//            }
        }


}

