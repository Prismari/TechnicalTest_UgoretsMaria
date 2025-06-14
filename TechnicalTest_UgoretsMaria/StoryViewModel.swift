//
//  StoryViewModel.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import SwiftUI

class StoryViewModel: ObservableObject {
    @Published var users: [User] = []
    
    let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
        self.loadData()
    }
    
    func loadNext() {
        users += self.repository.fetchUsers(offset: offset())
    }
    
    private func loadData() {
        users = self.repository.fetchUsers(offset: offset(), limit: 20)
        for user in users {
            print("user name: \(user.name), userId: \(user.userId)")
        }
    }
    
    private func offset() -> Int {
        guard let lastIndex = users.last?.userId else {
            return 0
        }
        return lastIndex + 1
    }
}
