//
//  UserErrors.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 25.01.2022.
//

import Foundation
import SwiftUI

enum UserErrors {
    case notFilled
    case photoNotExists
}

extension UserErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExists:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        }
    }
}
