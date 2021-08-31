//
//  ViewController.swift
//  TheRightDvorak
//
//  Created by Taylor Shaw on 1/22/18.
//  Copyright © 2018 Taylor Shaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

