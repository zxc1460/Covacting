//
//  HomeViewController.swift
//  Covacting
//
//  Created by Seok on 2021/03/12.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var timeSortButton: UIButton!
    @IBOutlet weak var likeSortButton: UIButton!
    @IBOutlet weak var sortButtonImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var vaccineView: UIView!
    
    // MARK: NSLayoutConstraints
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    // MARK: Variables
    let tags = ["화이자", "모더나", "아스트로제네카", "얀센"]
    var selectedTags = Set<String>()
    var content = "sjehruqiwheriuqwheriuqwgetuioqwgetoiqwetiqwehtpiqwehtqwuethiqwetbqwietbqwietbqwietbwiqetbqwiebfidsbgksajdgbaskldjgbaslkdgjbaslkdgjasbldkgjasblkgjsdbgklsajbdgklasjdbgkljwbelgkjwbqeglkwgsjehruqiwheriuqwheriuqwgetuioqwgetoiqwetiqwehtpiqwehtqwuethiqwetbqwietbqwietbqwietbwiqetbqwiebfidsbgksajdgbaskldjgbaslkdgjbaslkdgjasbldkgjasblkgjsdbgklsajbdgklasjdbgkljwbelgkjwbqeglkwgsjehruqiwheriuqwheriuqwgetuioqwgetoiqwetiqwehtpiqwehtqwuethiqwetbqwietbqwietbqwietbwiqetbqwiebfidsbgksajdgbaskldjgbaslkdgjbaslkdgjasbldkgjasblkgjsdbgklsajbdgklasjdbgkljwbelgkjwbqeglkwgsjehruqiwheriuqwheriuqwgetuioqwgetoiqwetiqwehtpiqwehtqwuethiqwetbqwietbqwietbqwietbwiqetbqwiebfidsbgksajdgbaskldjgbaslkdgjbaslkdgjasbldkgjasblkgjsdbgklsajbdgklasjdbgkljwbelgkjwbqeglkwgsjehruqiwheriuqwheriuqwgetuioqwgetoiqwetiqwehtpiqwehtqwuethiqwetbqwietbqwietbqwietbwiqetbqwiebfidsbgksajdgbaskldjgbaslkdgjbaslkdgjasbldkgjasblkgjsdbgklsajbdgklasjdbgkljwbelgkjwbqeglkwgsjehruqiwheriuqwheriuqwgetuioqwgetoiqwetiqwehtpiqwehtqwuethiqwetbqwietbqwietbqwietbwiqetbqwiebfidsbgksajdgbaskldjgbaslkdgjbaslkdgjasbldkgjasblkgjsdbgklsajbdgklasjdbgkljwbelgkjwbqeglkwgsjehruqiwheriuqwheriuqwgetuioqwgetoiqwetiqwehtpiqwehtqwuethiqwetbqwietbqwietbqwietbwiqetbqwiebfidsbgksajdgbaskldjgbaslkdgjbaslkdgjasbldkgjasblkgjsdbgklsajbdgklasjdbgkljwbelgkjwbqeglkwgsjehruqiwheriuqwheriuqwgetuioqwgetoiqwetiqwehtpiqwehtqwuethiqwetbqwietbqwietbqwietbwiqetbqwiebfidsbgksajdgbaskldjgbaslkdgjbaslkdgjasbldkgjasblkgjsdbgklsajbdgklasjdbgkljwbelgkjwbqeglkwg"
    var isTimeSort: Bool = true {
        didSet {
            if isTimeSort {
                sortButtonImageView.image = UIImage(named: "timeSortImage")
            } else {
                sortButtonImageView.image = UIImage(named: "likeSortImage")
            }
        }
    }
    lazy var dataManager = HomeDataManager(delegate: self)
    var data: [ReviewHomeResult]?
    
    
    // MARK: IBActions
    @IBAction func timeSortButtonClicked(_ sender: UIButton) {
        isTimeSort = true
        
        self.showIndicator()
        requestReview()
    }
    @IBAction func likeSortButtonClicked(_ sender: Any) {
        isTimeSort = false
        
        self.showIndicator()
        requestReview()
    }
    
    // MARK: View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = nil
        
        initView()
        initTagCollectionView()
        initBarButton()
        initTableView()
        initRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
        mainLogoImageView.isHidden = false
        
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        self.showIndicator()
        requestReview()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tableView.removeObserver(self, forKeyPath: "contentSize")
        mainLogoImageView.isHidden = true
    }
    
    // MARK: init Methods
    func initBarButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconWriting"), style: .plain, target: self, action: #selector(pushReviewWrite))
        self.navigationItem.backButtonTitle = "홈"
    }
    
    func initRefreshControl() {
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl(_:)), for: .valueChanged)
    }
    
    func initTagCollectionView() {
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        tagCollectionView.register(UINib(nibName: tagCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: tagCollectionViewCell.reuseIdentifier)
        
        if let layout = tagCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 9
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        tagCollectionView.allowsMultipleSelection = true
        
    }
    
    func initView() {
        vaccineView.layer.makeShadow(color: UIColor(red: 210/255, green: 220/255, blue: 225/255, alpha: 1), x: 0, y: 2, blur: 11, spread: -1)
    }
    
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: ReviewTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ReviewTableViewCell.reuseIdentifier)
        
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 294
        tableView.allowsSelection = false
    }
    
    // MARK: Selector
    @objc func handleRefreshControl(_ sender: UIRefreshControl) {
        requestReview()
    }
    
    @objc func pushReviewWrite() {
        self.navigationController?.pushViewController(ReviewWriteViewController(), animated: true)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if change?[.newKey] != nil {
                tableViewHeight.constant = tableView.contentSize.height
            }
        }
    }
    
    func requestReview() {
        var standard: Int = 1
        if !isTimeSort {
            standard = 2
        }
        let array = Array(selectedTags)
        
        var vaccineName1: String?
        var vaccineName2: String?
        var vaccineName3: String?
        
        
        vaccineName1 = array.first
        
        if array.count > 1 {
            vaccineName2 = array[1]
        }
        
        if array.count > 2 {
            vaccineName3 = array[2]
        }
        
        dataManager.getReviews(standard: standard, vaccineName1: vaccineName1, vaccineName2: vaccineName2, vaccineName3: vaccineName3)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagCollectionViewCell.reuseIdentifier, for: indexPath) as? tagCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setCellDetail(tagName: tags[indexPath.row], cornerRadius: 19)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (tags[indexPath.row] as NSString).size(withAttributes: [NSAttributedString.Key.font : UIFont.AppleSDGothicNeo(.semiBold, size: 17)]).width + 30, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedTags.count < 3 {
            selectedTags.insert(tags[indexPath.row])
            self.showIndicator()
            self.requestReview()
        } else {
            self.presentAlert(title: "최대 3개까지 선택 가능합니다")
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedTags.remove(tags[indexPath.row])
        self.showIndicator()
        self.requestReview()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.reuseIdentifier, for: indexPath) as? ReviewTableViewCell else {
            return UITableViewCell()
        }
        
        if let data = data {
            cell.setTextDelegate(homeData: data[indexPath.section], index: indexPath.section, delegate: self)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 240/255, green: 242/255, blue: 245/255, alpha: 1)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 7
    }
}

extension HomeViewController: ReviewTableViewCellDelegate {
    func expandButtonClicked(index: Int, isExpanded: Bool) {
        data?[index].isExpanded = isExpanded
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func likeButtonClicked(index: Int, likeClicked: Bool) {
        data?[index].likeClicked = likeClicked
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func didSuccessGetReviews(result: [ReviewHomeResult]) {
        self.data = result
        self.dismissIndicator()
        scrollView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    
    
}
