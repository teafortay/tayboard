//
//  SettingsView.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 12/27/23.
//  Copyright © 2023 Taylor Shaw. All rights reserved.
//

import UIKit

class SettingsView: UIView {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    weak var kvc: KeyboardViewController?
    
    init(frame: CGRect, kvc: KeyboardViewController) {
        super.init(frame: frame)
        self.kvc = kvc
        let table = UITableView()
        table.frame = self.bounds
        self.addSubview(table)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
}
