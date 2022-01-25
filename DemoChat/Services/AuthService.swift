//
//  AuthService.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 25.01.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthService {
    
    // делаем синглтон
    static let shared = AuthService()
    
    private let auth = Auth.auth()
    
    // если мы что-то возвращаем с complition блоком то надо использовать приставку escaping
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        guard Validators.isFilled(email: email, password: password, confirmPassword: confirmPassword) else {
            completion(.failure(AuthErrors.notFilled))
            return
        }
        
        guard password!.lowercased() == confirmPassword!.lowercased() else {
            completion(.failure(AuthErrors.passwordNotMatched))
            return
        }
        
        guard Validators.isSimpleEmail(email!) else {
            completion(.failure(AuthErrors.invalidEmail))
            return
        }
        
        
        auth.createUser(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        guard let email = email,
              let password = password else {
                  completion(.failure(AuthErrors.notFilled))
                  return
              }
        
        auth.signIn(withEmail: email, password: password) { result, error in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
}
