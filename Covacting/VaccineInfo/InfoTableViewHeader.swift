//
//  InfoTableViewHeader.swift
//  Covacting
//
//  Created by HanaHan on 2021/03/13.
//

import UIKit

class InfoTableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var tabNameLabel: UILabel!
    @IBOutlet weak var highlightView: UIView!
    
    func setupUI() {
        highlightView.backgroundColor = .veryLightBlue
        highlightView.alpha = 0.5
        tabNameLabel.textColor = .brownishGrey
    }
}
