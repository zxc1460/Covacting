//
//  BaseTabBarController.swift
//  Covacting
//
//  Created by Seok on 2021/03/12.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    let mainLogoImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "mainLogo"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Color
        self.view.backgroundColor = .white
    
        let appearance = UINavigationBarAppearance()
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundColor = .white
        self.navigationController?.navigationBar.standardAppearance = appearance
        addMainLogoInNavigationBar()
    }
    

    func addMainLogoInNavigationBar() {
        self.navigationController?.navigationBar.addSubview(mainLogoImageView)
        
        mainLogoImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(21)
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-7)
        }
    }
}

