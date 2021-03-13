//
//  MyVaccineHistoryViewController.swift
//  Covacting
//
//  Created by HanaHan on 2021/03/13.
//

import UIKit

class MyVaccineHistoryViewController: UIViewController {
    let vaccineTypes: [String] = ["화이자", "모더나", "아스트라제네카", "얀센"]
    let datePicker = UIDatePicker()
    @IBOutlet weak var vaccineTypeLabel: UILabel!
    @IBOutlet weak var firstDateLabel: UILabel!
    @IBOutlet weak var secondDateLabel: UILabel!
    @IBOutlet weak var vaccineTermTitleLabel: UILabel!
    @IBOutlet weak var vaccineTermLabel: UILabel!
    
    @IBOutlet weak var vaccineTypeField: UITextField!
    
    @IBOutlet weak var firstDateField: UITextField!
    @IBOutlet weak var secondDateField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createPickerView(tagNo: 1)
        initTextField(name: "", email: "")
        showDatePicker()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    private func setupUI() {
        setNaviBar()
        vaccineTypeLabel.textColor = .brightBlue
        firstDateLabel.textColor = .brightBlue
        secondDateLabel.textColor = .brightBlue
        vaccineTermTitleLabel.textColor = .brightBlue
        vaccineTermLabel.textColor = .brownishGrey
        vaccineTypeField.textColor = .brownishGrey
        firstDateField.textColor = .brownishGrey
        secondDateField.textColor = .brownishGrey
    }
    
    private func setNaviBar() {
        self.navigationItem.title = "내 접종 기록"
        self.navigationController?.navigationBar.topItem?.title = ""
        let rightButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneAction(sender:)))
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.rightBarButtonItem?.tintColor = .deepSkyBlue
        self.navigationController?.navigationBar.tintColor = .deepSkyBlue
    }
    
    private func initTextField(name: String, email: String) {
//        firstDateField.setDatePicker(target: self, selector: #selector(doneDateAction))
    }
    
    @objc func doneAction(sender: UIBarButtonItem) {
        // 입력 정보 중복 검사, 유효성 검사 후 창닫기
        navigationController?.popViewController(animated: true)
    }
    
    //
    func createPickerView(tagNo : Int) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        vaccineTypeField.inputView = pickerView
    }
    
    func showDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        firstDateField.inputAccessoryView = toolbar
        firstDateField.inputView = datePicker
        secondDateField.inputAccessoryView = toolbar
        secondDateField.inputView = datePicker
   }

    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        if firstDateField.isFirstResponder {
            firstDateField.text = formatter.string(from: datePicker.date)
            self.view.endEditing(true)
        } else {
            secondDateField.text = formatter.string(from: datePicker.date)
            self.view.endEditing(true)
        }
   }

   @objc func cancelDatePicker(){
      self.view.endEditing(true)
    }
}

extension MyVaccineHistoryViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        vaccineTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vaccineTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        vaccineTypeField.text = vaccineTypes[row]
        self.view.endEditing(true)
    }
    
}

 
 
