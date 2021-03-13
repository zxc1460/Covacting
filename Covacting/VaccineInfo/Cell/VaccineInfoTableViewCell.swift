//
//  VaccineInfoTableViewCell.swift
//  Covacting
//
//  Created by HanaHan on 2021/03/12.
//

import UIKit

class VaccineInfoTableViewCell: UITableViewCell {
    static var identifier: String = "VaccineInfoTableViewCell"
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupUI() {
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = .zero
        self.layoutMargins = .zero
        infoTitleLabel.textColor = .brownishGrey
        moreInfoButton.tintColor = .brownishGrey
    }
    
    func configure() {
        
    }
    
}
