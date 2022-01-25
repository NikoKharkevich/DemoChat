//
//  Validators.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 25.01.2022.
//

import Foundation

class Validators {
    
    static func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let email = email,
              let password = password,
              let confirmPassword = confirmPassword,
              email != "",
              password != "",
              confirmPassword != "" else { return false }
        return true
    }
    
    static func isFilled(userName: String?, desciption: String?, sex: String?) -> Bool {
        guard let userName = userName,
              let description = desciption,
              let sex = sex,
              userName != "",
              description != "",
              sex != "" else { return false }
        return true
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
}
