//
//  AuthErrors.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 25.01.2022.
//

import Foundation

enum AuthErrors {
    case notFilled
    case invalidEmail
    case passwordNotMatched
    case unknownError
    case serverError
}

extension AuthErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Формат почты не является допустимым", comment: "")
        case .passwordNotMatched:
            return NSLocalizedString("Пароли не совпадают", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        case .serverError:
            return NSLocalizedString("Ошибка сервера", comment: "")
        }
    }
}
