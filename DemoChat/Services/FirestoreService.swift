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
    
    func saveProfileWith(id: String, email: String, userName: String?, avatarImageString: String?, description: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(userName: userName, desciption: description, sex: sex) else {
            completion(.failure(UserErrors.notFilled))
            return
        }
        
        let muser = MUser(userName: userName!, email: email, avatarStringURL: "", description: description!, id: id, sex: sex!)
        
        self.usersRef.document(muser.id).setData(muser.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(muser))
            }
        }
    }
}
