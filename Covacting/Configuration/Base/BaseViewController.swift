//
//  BaseViewController.swift
//  Covacting
//
//  Created by Seok on 2021/03/12.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    let homeViewController  = BaseViewController()
    let vaccineInfoViewController = BaseViewController()
    let myPageViewController = BaseViewController()
    
    let homeTabBarItem  = UITabBarItem(title: "홈", image: nil, tag: 0)
    let vaccineInfoTabBarItem  = UITabBarItem(title: "백신 정보", image: nil, tag: 1)
    let myPageTabBarItem  = UITabBarItem(title: "내 정보", image: nil, tag: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let vaccineInfoNavigationController = UINavigationController(rootViewController: vaccineInfoViewController)
        let myPageNavigationController = UINavigationController(rootViewController: myPageViewController)
        
        homeNavigationController.tabBarItem = homeTabBarItem
        vaccineInfoNavigationController.tabBarItem = vaccineInfoTabBarItem
        myPageNavigationController.tabBarItem = myPageTabBarItem
        
        self.viewControllers = [homeNavigationController, vaccineInfoNavigationController, myPageNavigationController]
        
        self.delegate = self
    }
}

