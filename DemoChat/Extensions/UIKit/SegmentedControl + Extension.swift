//
//  SegmentedControl + Extension.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 22.01.2022.
//

import UIKit

extension UISegmentedControl {
    convenience init(first: String, second: String) {
        self.init()
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.selectedSegmentIndex = 0
    }
}
