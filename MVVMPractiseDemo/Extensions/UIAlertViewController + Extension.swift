//
//  UIAlertViewController + Extension.swift
//  MVVMDemo
//
//  Created by Amit on 18/02/23.
//

import UIKit
extension UIViewController {
    func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:
            nil))
        present(alert, animated: true, completion: nil)
    }
}
