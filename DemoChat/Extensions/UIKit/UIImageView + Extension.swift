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

// для изменения цвета кнопки или смайла в leftView textFiled
extension UIImageView {
    func setupColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
