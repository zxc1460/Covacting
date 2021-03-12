//
//  HomeViewController.swift
//  Covacting
//
//  Created by Seok on 2021/03/12.
//

import UIKit
import TagListView

class HomeViewController: UIViewController {
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var timeSortButton: UIButton!
    @IBOutlet weak var likeSortButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var isTimeSort: Bool = true {
        didSet {
            if isTimeSort {
                timeSortButton.layer.addBorder([.top, .left, .right], color: .brightBlue, width: 2)
                likeSortButton.layer.addBorder([.top, .left, .right, .bottom], color: .brightBlue, width: 2)
            } else {
                likeSortButton.layer.addBorder([.top, .left, .right], color: .brightBlue, width: 2)
                timeSortButton.layer.addBorder([.top, .left, .right, .bottom], color: .brightBlue, width: 2)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
        
        isTimeSort = true
    }
}
