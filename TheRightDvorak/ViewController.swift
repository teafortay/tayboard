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
            
            6. In order to use haptics, you also need to "Allow Full Access" by selecting "Dvorak-Right-Handed__Right Dvorak" and hitting the toggle.
            
            View our privacy policy anytime by visiting our website:taylorcodeshop.com/theRightDvorak
            """

        let htmlString = """
<strong>The Right Dvorak App Information</strong>
<br />
<p>
The Right Dorvak is an open source project created and maintained by me, Taylor Shaw. I use the Dvorak-Right-Handed keyboard on my personal computer. I wanted to be able to use the same keyboard on my iPad, so I created the app.
</p>
<b>Privacy Policy</b>
<br />
<p>
Privacy is very important to us. We started collectig user data with app version 2.0. We collect minimal data in order to store your settings preferences. We store this data locally; we do not transmit any data over the network.
</p>
<p>
Another important change with app version 2.0 and later, is that we request Full Access. By pressing "Allow Full Access", you are granting the developer access to certain systems, such as Location Servics and Address Book. We need Full Acess so that we can accass your device's haptic generator in order to provide haptic feedback. If you are not using haptics with this keyboard, whether or not you Allow Full Access makes no difference.
</p>
<b>Support</b>
    <br />
    <p>
    We offer no support for this product. You can email tay@taylorcodeshop.com if you would like to notify the developer of any bugs.
    </p>
"""
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

