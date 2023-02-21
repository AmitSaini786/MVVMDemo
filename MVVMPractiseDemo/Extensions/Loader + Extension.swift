//
//  Loader + Extension.swift
//  MVVMPractiseDemo
//
//  Created by Amit on 18/02/23.
//

import UIKit
import IHProgressHUD

extension UIViewController{
    func showIndicator(){
        DispatchQueue.main.async {
            IHProgressHUD.set(defaultStyle: .dark)
            IHProgressHUD.show()
        }
    }
    func hideIndicator(){
        DispatchQueue.main.async {
            IHProgressHUD.dismiss()
        }
    }
}
