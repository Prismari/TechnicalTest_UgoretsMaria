//
//  StoryModel.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import SwiftData

@Model
class StoryModel: Identifiable {
    var storyId: Int
    var userId: Int
    var imageURL: String
    var isSeen: Bool
    var isLiked: Bool

    init(storyId: Int, userId: Int, imageURL: String, isSeen: Bool = false, isLiked: Bool = false) {
        self.storyId = storyId
        self.userId = userId
        self.imageURL = imageURL
        self.isSeen = isSeen
        self.isLiked = isLiked
    }
}
