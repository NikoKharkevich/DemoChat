//
//  MUser.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 24.01.2022.
//

import UIKit

struct MUser: Hashable, Decodable {
    var userName: String
    var email: String
    var avatarStringURL: String
    var description: String
    var id: String
    var sex: String
    
    var representation: [String: Any] {
        var rep = ["userName": userName]
        rep["email"] = email
        rep["avatarStringURL"] = avatarStringURL
        rep["description"] = description
        rep["uid"] = id
        rep["sex"] = sex
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    // делаем спец функцию для фильра юзеров при поиске
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return userName.lowercased().contains(lowercasedFilter)
    }
}
