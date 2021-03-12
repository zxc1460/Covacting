//
//  ReviewTableViewCell.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    static let nibName = "ReviewTableViewCell"
    static let reuseIdentifier = "ReviewTableViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var vaccineTypeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var expandButton: UIButton!
    
    @IBOutlet weak var contentLabelHeight: NSLayoutConstraint! // 144 or more
    
    weak var delegate: ReviewTableViewCellDelegate?
    let contentLabelMinHeight: CGFloat = 144
    var contentText: String? {
        didSet {
            contentLabel.text = contentText ?? ""
        }
    }
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        likeButton.setImage(UIImage(named: "iconLikeAct"), for: .selected)
        likeButton.setImage(UIImage(named: "iconLikeInact"), for: .normal)
        expandButton.setTitleColor(.brownishGrey, for: .normal)
        expandButton.setTitleColor(.brownishGrey, for: .selected)
        expandButton.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        likeButton.addTarget(self, action: #selector(likeButtonClicked(_:)), for: .touchUpInside)
        expandButton.addTarget(self, action: #selector(expandButtonClicked(_:)), for: .touchUpInside)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTextDelegate(contentText: String, index: Int, delegate: ReviewTableViewCellDelegate) {
        self.index = index
        self.contentText = contentText
        self.delegate = delegate
    }
    
    @objc func expandButtonClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        expandButton.backgroundColor = .white
        
        if sender.isSelected {
            if let text = contentLabel.text {
                let size = CGSize(width: contentLabel.frame.width, height: .greatestFiniteMagnitude)

                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)

                let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: contentLabel.font as Any]

                let rectangleHeight = String(text).boundingRect(with: size, options: options, attributes: attributes, context: nil).height
                
                contentLabelHeight.constant = max(contentLabelMinHeight, rectangleHeight)
            }
        } else {
            contentLabelHeight.constant = contentLabelMinHeight
        }
        
        if let index = index {
            self.delegate?.expandButtonClicked(index: index, isExpanded: sender.isSelected)
        }
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc func commentButtonClicked(_ sender: UIButton) {
        
    }
}
