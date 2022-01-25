//
//  AuthNavigationDelegate.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 25.01.2022.
//

import Foundation

protocol AuthNavigationDelegate: AnyObject {
    func toLoginVC()
    func toSignUpVC()
}
