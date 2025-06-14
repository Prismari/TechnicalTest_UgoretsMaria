//
//  User.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import SwiftData

@Model
class User: Identifiable {
    var userId: Int
    var name: String
    var avatarURL: String
    
    init(userId: Int, name: String, avatarURL: String) {
        self.userId = userId
        self.name = name
        self.avatarURL = avatarURL
    }
}

