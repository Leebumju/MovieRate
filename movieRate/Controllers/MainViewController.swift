//
//  MainViewController.swift
//  PrographyQuest
//
//  Created by 이범준 on 2022/02/09.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    //MARK: MainViewController
    let pickerView = UIPickerView()
    var selectRate = ""
    let pickerData = ["0","1","2","3","4","5","6","7","8","9"]
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func sendText(_ sender: UIButton) {
        performSegue(withIdentifier: "showSecondView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondView" {
            let secondVC = segue.destination as! ViewController
            secondVC.minimum_rating = textField.text!
        }
    }
    
    override func viewDidLoad() {
        //MARK: MainViewController viewDidLoad()
        super.viewDidLoad()
        
        pickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220)
        pickerView.delegate = self
        pickerView.dataSource = self
              
        let pickerToolbar : UIToolbar = UIToolbar()
        pickerToolbar.barStyle = .default
        pickerToolbar.isTranslucent = true
        pickerToolbar.backgroundColor = .lightGray
        pickerToolbar.sizeToFit()
     
        let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(onPickDone))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancel))
        
        pickerToolbar.setItems([btnCancel , space , btnDone], animated: true)
        pickerToolbar.isUserInteractionEnabled = true
              
        textField.inputView = pickerView
        textField.inputAccessoryView = pickerToolbar
    }

    @objc func onPickDone() {
            textField.text = selectRate
            textField.resignFirstResponder()
            selectRate = ""
    }
        
    @objc func onPickCancel() {
        textField.resignFirstResponder()
        selectRate = ""
    }
     
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
     
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectRate = pickerData[row]
    }
}
