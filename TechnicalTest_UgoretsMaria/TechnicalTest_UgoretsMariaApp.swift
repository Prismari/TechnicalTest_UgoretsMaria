//
//  TechnicalTest_UgoretsMariaApp.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import SwiftUI
import SwiftData

@main
struct TechnicalTest_UgoretsMariaApp: App {
    var body: some Scene {
        WindowGroup {
            StoryAssembly()
                .make()
        }
        .modelContainer(for: [StoryModel.self, User.self])
    }
}

