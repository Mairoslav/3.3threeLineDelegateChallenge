//
//  ZipCodeTextFieldDelegate.swift
//  3.3 threeLineDelegateChallenge
//
//  Created by mairo on 18/03/2022.
//

import Foundation
import UIKit // import UIKit

// MARK: - ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate
class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField.text!.count >= 5 && !string.isEmpty) {
            return false // do not change/accept characters in range if text is 5 digits or longer
        }
    
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted // accept only Int values, Instance Property, A character set containing only characters that don’t exist in the receiver
        return (string.rangeOfCharacter(from: invalidCharacters) == nil)
        
        /*
        var newText = textField.text! as NSString // Code after 'return' will never be executed
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        return newText.length <= 5 // change/accept characters up to the 5 digits
        */
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}



