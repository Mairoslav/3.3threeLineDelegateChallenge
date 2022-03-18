//
//  ViewController.swift
//  3.3 threeLineDelegateChallenge
//
//  Created by mairo on 18/03/2022.
//

import UIKit

// MARK: add UITextFieldDelegate
class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: properties
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()

    // MARK: Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var editingSwitch: UISwitch!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.delegate = self.zipCodeDelegate
        // textField1.addTarget(self, action: #selector(self.editingChanged), for: .editingChanged) // non zero(0) prefix entry for ZIP
        textField2.delegate = self.cashDelegate
        textField3.delegate = self
        
        self.editingSwitch.setOn(false, animated: false)
    }
    
    // MARK: Text Field Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.editingSwitch.isOn
    }
    
    // MARK: Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Actions
    @IBAction func toggleTheTextEditor(_ sender: AnyObject) {
        
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
    }
    /*
    // non zero(0) prefix entry for ZIP
    @objc private func editingChanged(_ textField: UITextField) {
        if let num = Int(textField1.text!) {
            textField1.text = "\(num)" // input is either is Int
        } else {
            textField1.text = "" // or is empty string
        }
    }
    */
}


