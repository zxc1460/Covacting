//
//  BaseTabBarController.swift
//  Covacting
//
//  Created by Seok on 2021/03/12.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    let homeViewController  = BaseViewController()
    let vaccineInfoViewController = VaccineInfoViewController()
    let myPageViewController = BaseViewController()
    
    let homeTabBarItem  = UITabBarItem(title: "홈", image: nil, tag: 0)
    let vaccineInfoTabBarItem  = UITabBarItem(title: "백신 정보", image: nil, tag: 1)
    let myPageTabBarItem  = UITabBarItem(title: "내 정보", image: nil, tag: 2)
    
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Color
        self.view.backgroundColor = .white
    }
}

