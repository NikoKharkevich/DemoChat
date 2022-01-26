//
//  FirestoreService.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 25.01.2022.
//

import Firebase
import FirebaseFirestore

class FirestoreService {
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func getUserData(user: User, completion: @escaping (Result<MUser, Error>) -> Void) {
        let docRef = usersRef.document(user.uid)
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                guard let muser = MUser(document: document) else {
                    completion(.failure(UserErrors.cannotUnwrapToMuser))
                    return
                }
                completion(.success(muser))
            } else {
                completion(.failure(UserErrors.cannotGetUserInfo))
            }
        }
    }
    
    // загружаем информацию о пользователе в Firestore
    func saveProfileWith(id: String, email: String, userName: String?, avatarImage: UIImage?, description: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(userName: userName, desciption: description, sex: sex) else {
            completion(.failure(UserErrors.notFilled))
            return
        }
        
        guard avatarImage != #imageLiteral(resourceName: "avatar") else {
            completion(.failure(UserErrors.photoNotExists))
            return
        }
        
        var muser = MUser(userName: userName!, email: email, avatarStringURL: "", description: description!, id: id, sex: sex!)
        
        StorageService.shared.upload(photo: avatarImage!) { result in
            switch result {
            case .success(let url):
                muser.avatarStringURL = url.absoluteString
                self.usersRef.document(muser.id).setData(muser.representation) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(muser))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
