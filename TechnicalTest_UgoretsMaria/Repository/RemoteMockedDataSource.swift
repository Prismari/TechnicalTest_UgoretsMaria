//
//  RemoteMockedDataSource.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

class RemoteMockedDataSource {
    
    private static let names = [
        "Alice", "Bob", "Charlie", "Diana", "Eve", "Frank", "Grace", "Hank", "Ivy", "Jack",
        "Kathy", "Leo", "Mona", "Nate", "Olivia", "Paul", "Quincy", "Rachel", "Steve", "Tina",
        "Uma", "Victor", "Wendy", "Xander", "Yara", "Zack", "Ann", "Brian", "Cathy", "Doug",
        "Elle", "Fred", "Gina", "Harry", "Isla", "Jason", "Karen", "Liam", "Megan", "Noah",
        "Opal", "Pete", "Queen", "Rudy", "Sara", "Tom", "Ursula", "Vince", "Will", "Zoey"
    ]

    static func generateUsersWithStories(offset: Int, limit: Int) -> (users: [User], stories: [StoryModel]) {
        var users: [User] = []
        var stories: [StoryModel] = []

        for index in offset..<(offset + limit) {
            let user = User(
                userId: index,
                name: names[index % names.count],
                avatarURL: "https://i.pravatar.cc/150?img=\(((index % 70) + 1))"
            )
            users.append(user)

            let numberOfStories = Int.random(in: 1...3)
            for storyIndex in 0..<numberOfStories {
                let story = StoryModel(
                    storyId: index * 100 + storyIndex,
                    userId: user.userId,
                    imageURL: "https://picsum.photos/id/\((index * 10 + storyIndex) % 1000)/400/600"
                )
                stories.append(story)
            }
        }

        return (users, stories)
    }
}
