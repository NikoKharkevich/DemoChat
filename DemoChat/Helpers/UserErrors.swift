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
    case cannotGetUserInfo
    case cannotUnwrapToMuser
}

extension UserErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExists:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Невозможно загрузить информацию о пользователе", comment: "")
        case .cannotUnwrapToMuser:
            return NSLocalizedString("Невозможно конвертировать Muser из User", comment: "")
        }
    }
}
