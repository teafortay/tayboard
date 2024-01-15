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
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
//    weak var kvc: KeyboardViewController?
    
    init(frame: CGRect, settings: Settings, callback: @escaping (Settings) -> Void) {
        self.settings = settings
        self.save = callback
        super.init(frame: frame)
        let table = UITableView()
        table.frame = self.bounds
        self.addSubview(table)
        var frame = CGRect(x: 10, y: 100, width: 300, height: 50)
        frame.origin.y += 50
        frame.origin.x = 10
        frame.size.width = 300
        let closeButon = UIButton(frame: frame)
        closeButon.setTitle("Close", for: .normal)
        closeButon.backgroundColor = .magenta
        closeButon.addTarget(
            self,
            action: #selector(closePressed),
            for: .touchUpInside)
        self.addSubview(closeButon)
    }
    
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
