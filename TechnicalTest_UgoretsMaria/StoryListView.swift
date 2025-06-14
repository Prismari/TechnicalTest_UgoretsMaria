//
//  StoryListView.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import SwiftUI

struct StoryListView: View {
    @ObservedObject private var viewModel: StoryViewModel
    @State private var isLoading = false
    
    init(viewModel: StoryViewModel, isLoading: Bool = false) {
        self.viewModel = viewModel
        self.isLoading = isLoading
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(destination: StoryPlayerView(viewModel: StoryPlayerViewModel(repository: viewModel.repository, userId: user.userId))) {
                            VStack {
                                AsyncImage(url: URL(string: user.avatarURL)) { phase in
                                    if let image = phase.image {
                                        image.resizable()
                                    } else if phase.error != nil {
                                        Color.red
                                    } else {
                                        Color.gray
                                    }
                                }
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                
                                Text(user.name)
                                    .font(.caption)
                            }
                            .onAppear {
                                if user == viewModel.users.last {
                                    viewModel.loadNext()
                                }
                            }
                        }
                    }
                    if isLoading {
                        ProgressView()
                            .padding()
                    }
                }
                .padding()
            }
            .navigationTitle("Stories")
        }
    }
}
