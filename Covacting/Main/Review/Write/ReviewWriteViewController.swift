//
//  ReviewWriteViewController.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

import UIKit

class ReviewWriteViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vaccineTextField: UITextField!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var reviewTextViewHeight: NSLayoutConstraint!
    
    
    // MARK: Views By Code
    let pickerView = UIPickerView()
    let toolBar = UIToolbar()
    
    // MARK: Variables
    lazy var reviewTextViewHeightMinValue = self.view.frame.height * 0.548726
    let vaccins: [String] = ["화이자", "모더나", "아스트라제네카", "얀센"]
    lazy var dataManager = ReviewWriteDataManager(delegate: self)
    
    // MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "후기 작성하기"
        
        initScrollView()
        initTextView()
        initTextField()
        initBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: init Methods
    
    func initBarButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(writeDone))
    }
    
    func initScrollView() {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(emptySpaceTapped))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        
        singleTapGestureRecognizer.isEnabled = true
        
        singleTapGestureRecognizer.cancelsTouchesInView = false
        
        scrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    func initTextView() {
        reviewTextView.delegate = self
        reviewTextViewHeight.constant = reviewTextViewHeightMinValue
    }
    
    func initTextField() {
        pickerView.delegate = self
        pickerView.dataSource = self
        vaccineTextField.returnKeyType = .done
        
        pickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 217)
        pickerView.backgroundColor = .white
        
        toolBar.barStyle = .default
        toolBar.barTintColor = UIColor(hex: 0xFAFAF8)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(pickerDone))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(pickerCancel))
        toolBar.setItems([cancelButton, space, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        vaccineTextField.inputView = pickerView
        vaccineTextField.inputAccessoryView = toolBar
        vaccineTextField.tintColor = .clear
    }
    
    // MARK: Selectors
    
    @objc func pickerDone() {
        vaccineTextField.text = vaccins[pickerView.selectedRow(inComponent: 0)]
        vaccineTextField.resignFirstResponder()
        
    }
    
    @objc func pickerCancel() {
        vaccineTextField.resignFirstResponder()
    }
    
    @objc func emptySpaceTapped() {
        self.view.endEditing(true)
    }
    
    @objc func writeDone() {
        let alert = UIAlertController(title: "후기를 등록하시겠어요?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "등록", style: .default, handler: { (alertAction) in
            guard self.vaccineTextField.text!.count > 0 else {
                self.presentAlert(title: "백신 종류를 선택해주세요.")
                return
            }
            
            guard self.reviewTextView.text.count > 0 else {
                self.presentAlert(title: "후기를 입력해주세요.")
                return
            }
            
            let body = ReviewWriteBody(reviewContent: self.reviewTextView.text, vaccineName: self.vaccineTextField.text!)
            self.dataManager.postReview(body: body)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

}

// MARK: UITextView Delegate

extension ReviewWriteViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let sizeToFitIn = CGSize(width: self.reviewTextView.bounds.size.width, height: CGFloat(MAXFLOAT))
        let newSize = self.reviewTextView.sizeThatFits(sizeToFitIn)
        self.reviewTextViewHeight.constant = max(reviewTextViewHeightMinValue, newSize.height)
    
    }
}

// MARK: UIPickerView Delegate

extension ReviewWriteViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vaccins.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vaccins[row]
    }
}


extension ReviewWriteViewController: ReviewWriteViewControllerDelegate {
    func didSuccessPostReview() {
        self.dismissIndicator()
        self.navigationController?.popViewController(animated: true)
    }
    
    func didSuccessPatchReview() {
    }
    
    func failedToRequest(message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
    
    
}
