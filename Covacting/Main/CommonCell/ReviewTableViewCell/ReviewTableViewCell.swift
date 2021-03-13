//
//  ReviewTableViewCell.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

import UIKit
import Kingfisher

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
    var homeData: ReviewHomeResult? {
        didSet {
            if let data = homeData {
                if let str = data.userProfileImgLink, let url = URL(string: str) {
                    profileImageView.kf.setImage(with: url)
                } else {
                    profileImageView.image = UIImage(named: "profileDefaultImage")
                }
                
                nicknameLabel.text = data.userNickname
                vaccineTypeLabel.text = data.vaccineName
                contentLabel.text = data.reviewContent
                likeCountLabel.text = "\(data.likeReviewCount)명이 좋아합니다"
                
                if let likeClicked = data.likeClicked, likeClicked {
                    likeButton.isSelected = true
                } else {
                    likeButton.isSelected = false
                }
                
                if data.likeStatus == 1 {
                    likeButton.isSelected = true
                } else {
                    likeButton.isSelected = false
                }
                
                if let isExpanded = data.isExpanded, isExpanded == true {
                    expandButton.isUserInteractionEnabled = false
                    expandButton.isHidden = true
                    contentLabelHeight.constant = max(contentLabelMinHeight, getLabelHeight())
                    if let index = index {
                        self.delegate?.expandButtonClicked(index: index, isExpanded: true)
                    }
                } else {
                    expandButton.isUserInteractionEnabled = true
                    expandButton.isHidden = false
                    contentLabelHeight.constant = contentLabelMinHeight
                    if let index = index {
                        self.delegate?.expandButtonClicked(index: index, isExpanded: false)
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageView.kf.indicatorType = .activity
        
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
    
    func setTextDelegate(homeData: ReviewHomeResult, index: Int, delegate: ReviewTableViewCellDelegate) {
        self.index = index
        self.homeData = homeData
        self.delegate = delegate
    }
    
    @objc func expandButtonClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        expandButton.backgroundColor = .white
        expandButton.isHidden = true
        expandButton.isUserInteractionEnabled = false
        
        if sender.isSelected {
            contentLabelHeight.constant = max(contentLabelMinHeight, getLabelHeight())
        } else {
            contentLabelHeight.constant = contentLabelMinHeight
        }
        
        if let index = index {
            self.delegate?.expandButtonClicked(index: index, isExpanded: sender.isSelected)
        }
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if let index = index {
            self.delegate?.likeButtonClicked(index: index, likeClicked: sender.isSelected)
        }
    }
    
    @objc func commentButtonClicked(_ sender: UIButton) {
        
    }
    
    func getLabelHeight() -> CGFloat {
        if let text = contentLabel.text {
            let size = CGSize(width: contentLabel.frame.width, height: .greatestFiniteMagnitude)

            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)

            let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: contentLabel.font as Any]

            let rectangleHeight = String(text).boundingRect(with: size, options: options, attributes: attributes, context: nil).height
            
            return rectangleHeight
        }
        return 0
    }
}
