//
//  DetailViewController.swift
//  Covacting
//
//  Created by HanaHan on 2021/03/13.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initWebView()

    }
    
    func initWebView() {
        guard let url = URL(string:"https://www.youtube.com/watch?v=1EU6KyfVGkM") else {return}
        let request = URLRequest(url: url)
        webView?.load(request)
    }

}
