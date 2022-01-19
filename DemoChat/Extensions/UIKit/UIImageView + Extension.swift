//
//  UIImageView + Extension.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 19.01.2022.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}
