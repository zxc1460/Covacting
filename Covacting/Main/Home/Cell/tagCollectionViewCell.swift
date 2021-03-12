//
//  tagCollectionViewCell.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

import UIKit

class tagCollectionViewCell: UICollectionViewCell {
    static let nibName = "tagCollectionViewCell"
    static let reuseIdentifier = "tagCollectionViewCell"
    
    
    @IBOutlet weak var tagLabel: UILabel!
    
    var tagName: String? {
        didSet {
            if let tagName = tagName {
                tagLabel.text = tagName

            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = .brightBlue
                tagLabel.textColor = .white
            } else {
                self.backgroundColor = .white
                tagLabel.textColor = .brightBlue
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCellDetail(tagName: String, cornerRadius: CGFloat) {
        self.tagName = tagName
        self.cornerRadius = cornerRadius
    }

}
