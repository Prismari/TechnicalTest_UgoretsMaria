//
//  LocalDataSource.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import SwiftUI
import SwiftData

class LocalDataSource {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchUsers(offset: Int?, limit: Int? = 20) -> [User] {
        var descriptor = FetchDescriptor<User>(
            sortBy: [SortDescriptor(\.userId, order: .forward)]
        )
        descriptor.fetchOffset = offset
        if let limit {
            descriptor.fetchLimit = limit
        }
        
        return (try? context.fetch(descriptor)) ?? []
    }
    
    func fetchUnseenStories(forUserId userId: Int) -> [StoryModel] {
        let predicate = #Predicate<StoryModel> { story in
            story.userId == userId && story.isSeen == false
        }
        
        let descriptor = FetchDescriptor<StoryModel>(
            predicate: predicate,
            sortBy: [SortDescriptor(\.storyId, order: .forward)]
        )
        
        return (try? context.fetch(descriptor)) ?? []
    }
    
    func insertNewUsers(_ incoming: [User]) {
        let existingIDs: Set<Int> = Set(
            fetchUsers(offset: 0, limit: nil).map { $0.userId }
        )
        let newUsers = incoming.filter { !existingIDs.contains($0.userId) }
        for user in newUsers {
            context.insert(user)
        }
        saveContext()
    }
    
    func insertNewStories(_ incoming: [StoryModel]) {
        let existingIDs: Set<Int> = Set(
            fetchStories().map(\.storyId)
        )
        let newStories = incoming.filter { !existingIDs.contains($0.storyId) }
        for story in newStories {
            context.insert(story)
        }
        saveContext()
    }
    
    func toggleLike(for storyId: Int) {
        print("toggleLike storyId \(storyId)")
        if let existing = fetchStory(by: storyId) {
            print("existing storyId \(storyId), url \(existing.imageURL)")
            
            existing.isLiked.toggle()
            saveContext()
        }
    }
    
    func markSeen(storyId: Int) {
        print("markSeen storyId \(storyId)")
        
        if let existing = fetchStory(by: storyId) {
            print("existing storyId \(storyId), url \(existing.imageURL)")
            existing.isSeen = true
            saveContext()
        }
    }
    
    private func fetchStories() -> [StoryModel] {
        let query = FetchDescriptor<StoryModel>(sortBy: [SortDescriptor(\.storyId)])
        return (try? context.fetch(query)) ?? []
    }
    
    private func fetchStory(by id: Int) -> StoryModel? {
        let query = FetchDescriptor<StoryModel>(
            predicate: #Predicate { $0.storyId == id }
        )
        return (try? context.fetch(query))?.first
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save SwiftData context: \(error)")
        }
    }
}
