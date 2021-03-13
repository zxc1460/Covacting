//
//  CommentTableViewCell.swift
//  Covacting
//
//  Created by HanaHan on 2021/03/13.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    static var identifier: String = "CommentTableViewCell"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        
    }
    
    
    func setupUI() {
        nameLabel.textColor = .brightBlue
        dateLabel.textColor = .brownishGrey
        timeLabel.textColor = .brownishGrey
        commentLabel.textColor = .brownishGrey
        deleteButton.tintColor = .brownishGrey
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = .zero
        self.layoutMargins = .zero
    }

    func configure() {
        
    }
}

