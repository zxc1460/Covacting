//
//  CommentsViewController.swift
//  Covacting
//
//  Created by HanaHan on 2021/03/13.
//

import UIKit

class CommentsViewController: UIViewController {
    var comments: [String] = ["test1", "test1", "test1", "test1", "test1"]
    @IBOutlet weak var commentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        setNaviBar()
        setTableView()
    }
    
    private func setNaviBar() {
        self.navigationItem.title = "내가 쓴 댓글"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .deepSkyBlue
    }

    private func setTableView() {
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        commentsTableView.register(UINib(nibName: CommentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CommentTableViewCell.identifier)
    }
    
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as? CommentTableViewCell
            else { return UITableViewCell() }
        cell.commentLabel.text = "test"
        
        return cell
    }
}
