//
//  UITextfield+Extension.swift
//  FinancialApp
//
//  Created by Chukwuemeka Jennifer on 27/12/2021.
//

import UIKit


extension UITextField {
    
    func addDoneButton() {
        let screenWidth = UIScreen.main.bounds.width
        let doneToolBar: UIToolbar = UIToolbar(frame: .init(x: 0, y: 0, width: screenWidth, height: 20))
        doneToolBar.barStyle = .default
        let flexBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard))
        let items = [flexBarButtonItem,doneBarButtonItem]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        inputAccessoryView = doneToolBar
    }
    @objc private func dismissKeyboard() {
        resignFirstResponder()
    }
}
