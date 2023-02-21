//
//  UIImageView + Extension.swift
//  MVVMPractiseDemo
//
//  Created by Amit on 18/02/23.
//

import UIKit
import Kingfisher


extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else{return}
        
        let resource  = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
