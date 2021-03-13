//
//  BaseViewController.swift
//  Covacting
//
//  Created by Seok on 2021/03/12.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    let homeViewController  = HomeViewController()
    let vaccineInfoViewController = BaseViewController()
    let myPageViewController = BaseViewController()
    
    let homeTabBarItem  = UITabBarItem(title: nil, image: UIImage(named: "iconHomeInact"), selectedImage: UIImage(named: "iconHomeAct"))
    let vaccineInfoTabBarItem  = UITabBarItem(title: nil, image: UIImage(named: "iconVaccineInact"), selectedImage: UIImage(named: "iconVaccineAct"))
    let myPageTabBarItem  = UITabBarItem(title: nil, image: UIImage(named: "iconMypageInact"), selectedImage: UIImage(named: "iconMypageAct"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        homeTabBarItem.tag = 0
        vaccineInfoTabBarItem.tag = 1
        myPageTabBarItem.tag = 2
        
        homeTabBarItem.imageInsets.top = 10
        vaccineInfoTabBarItem.imageInsets.top = 10
        myPageTabBarItem.imageInsets.top = 10
        
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

