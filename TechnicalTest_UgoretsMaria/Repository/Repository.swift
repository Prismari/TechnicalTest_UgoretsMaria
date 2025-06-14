//
//  Repository.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import Foundation

class Repository {
    private let localDataSource: LocalDataSource
    
    init(localDataSource: LocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func fetchUsers(offset: Int = 0, limit: Int = 20) -> [User] {
        let users = localDataSource.fetchUsers(offset: offset, limit: limit)
        if !users.isEmpty {
            return users
        } else {
            let newGeneratedData = RemoteMockedDataSource.generateUsersWithStories(offset: offset, limit: limit)
            localDataSource.insertNewUsers(newGeneratedData.users)
            localDataSource.insertNewStories(newGeneratedData.stories)
            return newGeneratedData.users
        }
    }
    
    func fetchUnseenStories(forUserId userId: Int) -> [StoryModel] {
        let result = localDataSource.fetchUnseenStories(forUserId: userId)
        return result
    }
    
    func toggleLike(for storyId: Int) {
        localDataSource.toggleLike(for: storyId)
    }
    
    func markSeen(storyId: Int) {
        localDataSource.markSeen(storyId: storyId)

    }
    
}
