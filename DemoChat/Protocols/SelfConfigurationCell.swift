//
//  SelfConfigurationCell.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 23.01.2022.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
