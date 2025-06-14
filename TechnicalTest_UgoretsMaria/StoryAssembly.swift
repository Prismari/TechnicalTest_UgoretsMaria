//
//  StoryAssembly.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import SwiftUI

struct StoryAssembly {
    func make() -> some View {
        StoryListViewWrapper()
    }
}

struct StoryListViewWrapper: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        let dataSource = LocalDataSource(context: modelContext)
        let repository = Repository(localDataSource: dataSource)
        let viewModel = StoryViewModel(repository: repository)
        StoryListView(viewModel: viewModel)
    }
}
