//
//  AuthService.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 25.01.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftUI

class AuthService {
    
    // делаем синглтон
    static let shared = AuthService()
    
    private let auth = Auth.auth()
    
    // если мы что-то возвращаем с complition блоком то надо использовать приставку escaping
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
}
