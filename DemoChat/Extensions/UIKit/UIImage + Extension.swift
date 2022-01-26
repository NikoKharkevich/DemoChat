//
//  UIImage + Extension.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 26.01.2022.
//

import UIKit

// сжатие изображения для хранения
extension UIImage {

    var scaledToSafeUploadSize: UIImage? {
        
        let maxImageSideLength: CGFloat = 480
        let largerSide: CGFloat = max(size.width, size.height)
        let rationScale: CGFloat = largerSide > maxImageSideLength ? largerSide / maxImageSideLength : 1
        let newImageSize = CGSize(width: size.width / rationScale, height: size.height / rationScale)
        
        return image(scaledTo: newImageSize)
    }
    
    func image(scaledTo size: CGSize) -> UIImage? {
        defer {
            UIGraphicsEndImageContext()
        }
        
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(in: CGRect(origin: .zero, size: size))
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
