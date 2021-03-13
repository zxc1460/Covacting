//
//  MyPageViewController.swift
//  Covacting
//
//  Created by HanaHan on 2021/03/13.
//

import UIKit

class MyPageViewController: BaseViewController {
    let headerTitle: [String] = ["내 기록", "서비스 정보"]
    let historyMenu: [String] = ["내가 쓴 글", "내가 쓴 댓글", "내가 좋아요 누른 글"]
    let serviceMenu: [String] = ["오픈 소스 라이선스", "현재 버전"]
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var vaccinceHistoryTitle: UILabel!
    @IBOutlet weak var titleHighlightView: UIView!
    @IBOutlet weak var vaccinHistoryGroupView: UIView!
    @IBOutlet weak var firstVaccineDateTitleLabel: UILabel!
    @IBOutlet weak var firstVaccineDateLabel: UILabel!
    @IBOutlet weak var secondVaccineDateTitleLabel: UILabel!
    @IBOutlet weak var secondVaccineDataLabel: UILabel!
    @IBOutlet weak var secondVaccineDdayButton: UIButton!
    
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setGestgure()
    }
    
    private func setupUI() {
        setupTableView()
        makeShadowView()
        setNaviBar()
        initDdayButton(day: "D-DAY")
        userNameLabel.textColor = .brightBlue
        vaccinceHistoryTitle.textColor = .brownishGrey
        titleHighlightView.backgroundColor = .veryLightBlue
        titleHighlightView.alpha = 0.5
        firstVaccineDateTitleLabel.textColor = .brightBlue
        firstVaccineDateLabel.textColor = .brownishGrey
        secondVaccineDateTitleLabel.textColor = .brightBlue
        secondVaccineDataLabel.textColor = .brownishGrey
    }
    
    private func setupTableView() {
        menuTableView.delegate = self
        menuTableView.dataSource = self
        let headerNib = UINib.init(nibName: "InfoTableViewHeader", bundle: Bundle.main)
        menuTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "InfoTableViewHeader")
        menuTableView.register(UINib(nibName: VaccineInfoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: VaccineInfoTableViewCell.identifier)
    }
    
    func setGestgure() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(vaccineHistoryAction))
        self.vaccinHistoryGroupView.addGestureRecognizer(gesture)
    }
    
    func setNaviBar() {
        self.navigationController?.navigationBar.topItem?.title = ""
        let rightButton = UIBarButtonItem(image: UIImage(named: "group4"), style: .plain, target: self, action: #selector(settingAction(sender:)))
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func vaccineHistoryAction(sender : UITapGestureRecognizer) {
        navigationController?.pushViewController(MyVaccineHistoryViewController(), animated: true)
    }

    @objc func settingAction(sender: UIBarButtonItem) {
        navigationController?.pushViewController(ProfileSettingViewController(), animated: true)
    }
    
    private func makeShadowView() {
        vaccinHistoryGroupView.layer.cornerRadius = 10
        vaccinHistoryGroupView.layer.shadowRadius = 5
        vaccinHistoryGroupView.layer.shadowColor = UIColor.black.cgColor
        vaccinHistoryGroupView.layer.shadowOpacity = 0.2
        vaccinHistoryGroupView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    private func initDdayButton(day : String) {
        secondVaccineDdayButton.contentEdgeInsets = UIEdgeInsets(top: 1, left: 10, bottom: 3, right: 10)
        secondVaccineDdayButton.setTitleColor(.brightBlue, for: .normal)
        secondVaccineDdayButton.setTitle(day, for: .normal)
        secondVaccineDdayButton.layer.borderWidth = 1
        secondVaccineDdayButton.layer.borderColor = UIColor.brightBlue.cgColor
        secondVaccineDdayButton.backgroundColor = .white
        secondVaccineDdayButton.layer.cornerRadius = 4
    }
    
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return historyMenu.count
        default:
            return serviceMenu.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InfoTableViewHeader") as? InfoTableViewHeader else { return  UITableViewHeaderFooterView() }
        headerView.setupUI()
        headerView.tabNameLabel.text = headerTitle[section]
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VaccineInfoTableViewCell.identifier, for: indexPath) as? VaccineInfoTableViewCell
            else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0:
            cell.infoTitleLabel.text = historyMenu[indexPath.row]
        default:
            cell.infoTitleLabel.text = serviceMenu[indexPath.row]
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            print("TTT")
            navigationController?.pushViewController(CommentsViewController(), animated: true)
        } else  {
            navigationController?.pushViewController(DetailViewController(), animated: true)
        }
    }
    
    
}
