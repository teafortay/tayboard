//
//  SettingsView.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 12/27/23.
//  Copyright © 2023 Taylor Shaw. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    var settings: Settings
    var save: (Settings) -> Void
    
    //MARK: settings
    var enableCapsLockSwitch = UISwitch()
    var periodShortcutSwitch = UISwitch()
    var hapticsSwitch = UISwitch()
    var keyboardClicksSwitch = UISwitch()
    
    
    init(frame: CGRect, settings: Settings, callback: @escaping (Settings) -> Void) {
        self.settings = settings
        self.save = callback
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(redView)
        scrollViewContainer.addArrangedSubview(blueView)
        scrollViewContainer.addArrangedSubview(greenView)
        
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
        let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        let scrollViewContainer: UIStackView = {
            let view = UIStackView()
            
            view.axis = .vertical
            view.spacing = 10
            
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let redView: UIView = {
            let view = UIView()
            view.heightAnchor.constraint(equalToConstant: 500).isActive = true
            view.backgroundColor = .red
            return view
        }()
        
        let blueView: UIView = {
            let view = UIView()
            view.heightAnchor.constraint(equalToConstant: 200).isActive = true
            view.backgroundColor = .blue
            return view
        }()
        
        let greenView: UIView = {
            let view = UIView()
            view.heightAnchor.constraint(equalToConstant: 1200).isActive = true
            view.backgroundColor = .green
            return view
        }()
        //        closeButon.addTarget(
        //            self,
        //            action: #selector(closePressed),
        //            for: .touchUpInside)
    

    
    required init?(coder: NSCoder) {
//        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closePressed(_ sender: UIButton) {
        settings.haptics.value = true
        save(settings)
        self.removeFromSuperview()
    }
}
