//
//  ProfileSettingViewController.swift
//  Covacting
//
//  Created by HanaHan on 2021/03/13.
//

import UIKit

class ProfileSettingViewController: BaseViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initTextField(name: "유저", email: "test@gmail.com")
    }

    func setupUI() {
        setNaviBar()
        nameTitleLabel.textColor = .brownishGrey
        nameTextField.textColor = .brownishGrey
        emailTitleLabel.textColor = .brownishGrey
        emailField.textColor = .brownishGrey
    }
    
    private func setNaviBar() {
        self.navigationItem.title = "프로필 관리"
        self.navigationController?.navigationBar.topItem?.title = ""
        let rightButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneAction(sender:)))
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.rightBarButtonItem?.tintColor = .deepSkyBlue
        self.navigationController?.navigationBar.tintColor = .deepSkyBlue
    }
    
    private func initTextField(name: String, email: String) {
        nameTextField.placeholder = name
        emailField.placeholder = email
    }
    
    @objc func doneAction(sender: UIBarButtonItem) {
        // 입력 정보 중복 검사, 유효성 검사 후 창닫기
        navigationController?.popViewController(animated: true)
    }
}
