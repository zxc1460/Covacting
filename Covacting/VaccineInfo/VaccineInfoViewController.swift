//
//  VaccineInfoViewController.swift
//  Covacting
//
//  Created by HanaHan on 2021/03/12.
//

import UIKit

class VaccineInfoViewController: UIViewController {
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var viewSubTitleLabel: UILabel!
    @IBOutlet weak var vaccineInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupTableView()
        viewTitleLabel.textColor = .brightBlue
        viewSubTitleLabel.textColor = .brightBlue
    }

    private func setupTableView() {
        vaccineInfoTableView.delegate = self
        vaccineInfoTableView.dataSource = self
        let headerNib = UINib.init(nibName: "InfoTableViewHeader", bundle: Bundle.main)
        vaccineInfoTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "InfoTableViewHeader")
        vaccineInfoTableView.register(UINib(nibName: VaccineInfoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: VaccineInfoTableViewCell.identifier)
    }
}


extension VaccineInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InfoTableViewHeader") as? InfoTableViewHeader else { return  UITableViewHeaderFooterView() }
        headerView.setupUI()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VaccineInfoTableViewCell.identifier, for: indexPath) as? VaccineInfoTableViewCell
            else { return UITableViewCell() }
        // 웹뷰 url 전달
        cell.configure()

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    
}
