//
//  StoryPlayerViewModel.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import SwiftUI

class StoryPlayerViewModel: ObservableObject {
    @Published var stories: [StoryModel] = []
    
    private let repository: Repository
    
    init(repository: Repository, userId: Int) {
        self.repository = repository
        self.loadData(userId: userId)
    }

    func toggleLike(for storyId: Int) {
        repository.toggleLike(for: storyId)
    }
    
    func markSeen(storyId: Int) {
        repository.markSeen(storyId: storyId)
    }
    
    private func loadData(userId: Int) {
        stories = self.repository.fetchUnseenStories(forUserId: userId)
    }
}
