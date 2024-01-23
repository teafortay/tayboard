//
//  SettingsView.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 12/27/23.
//  Copyright © 2023 Taylor Shaw. All rights reserved.
// referenced this to mimic a UITableView w/o UIViewController: https://stackoverflow.com/questions/29094129/create-a-vertical-uiscrollview-programmatically-in-swift/54860024#54860024
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
        
        //header label
        let header = UILabel()
        header.text = "Settings"
        header.font = UIFont.boldSystemFont(ofSize: 16)
        addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        header.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        
        //close button footer
        let closeButton = UIButton()
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(
            self,
            action: #selector(closePressed),
            for: .touchUpInside)
        closeButton.backgroundColor = .darkGray
        closeButton.layer.cornerRadius = 10
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        
        addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        let caps = drawSetting(setting: settings.enableCapsLock, sw: enableCapsLockSwitch)
        scrollViewContainer.addArrangedSubview(caps)
        let shortcut = drawSetting(setting: settings.periodShortcut, sw: periodShortcutSwitch)
        scrollViewContainer.addArrangedSubview(shortcut)
        let haptics = drawSetting(setting: settings.haptics, sw: hapticsSwitch)
        scrollViewContainer.addArrangedSubview(haptics)
        let sound = drawSetting(setting: settings.keyboardClicks, sw: keyboardClicksSwitch)
        scrollViewContainer.addArrangedSubview(sound)
        scrollViewContainer.addArrangedSubview(redView)
//        scrollViewContainer.addArrangedSubview(blueView)
//        scrollViewContainer.addArrangedSubview(greenView)
        
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        
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
            view.spacing = 1
            
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    func drawSetting(setting: Setting, sw: UISwitch) -> UIView {
        let view = UIView()
        let name = UILabel()
        let detail = UILabel()
        
        name.text = setting.name
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .label
        name.textAlignment = .natural
        
        sw.setOn(setting.value, animated: false)
        sw.translatesAutoresizingMaskIntoConstraints = false
        
        if let detailText = setting.detail {
            detail.text = detailText
            detail.font = UIFont.systemFont(ofSize: 12)
            detail.numberOfLines = 3
            detail.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = .systemBackground
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(name)
        view.addSubview(sw)
        view.addSubview(detail)
        
        name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        name.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        sw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        sw.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        detail.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        detail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        detail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        return view
    }
        
        let redView: UIView = {
            let view = UIView()
            view.heightAnchor.constraint(equalToConstant: 150).isActive = true
            view.backgroundColor = .red
            return view
        }()
    

    
    required init?(coder: NSCoder) {
//        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closePressed(_ sender: UIButton) {
        settings.enableCapsLock.value = enableCapsLockSwitch.isOn
        settings.periodShortcut.value = periodShortcutSwitch.isOn
        settings.haptics.value = hapticsSwitch.isOn
        settings.keyboardClicks.value = keyboardClicksSwitch.isOn
        save(settings)
        self.removeFromSuperview()
    }
}
