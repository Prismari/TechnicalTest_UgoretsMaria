//
//  StoryPlayerView.swift
//  TechnicalTest_UgoretsMaria
//
//  Created by Maria Ugorec on 14.06.2025.
//

import SwiftUI

struct StoryPlayerView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var viewModel: StoryPlayerViewModel

    @State private var imageLoaded = false
    @State private var currentIndex: Int = 0
    @State private var progress: Double = 0.0
    private let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()

            if viewModel.stories.count > 0, currentIndex < viewModel.stories.count {
                let story = viewModel.stories[currentIndex]
                
                VStack {
                    ProgressView(value: progress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .white))
                        .padding()
                    
                    AsyncImage(url: URL(string: story.imageURL)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: .infinity)
                                .onAppear {
                                    imageLoaded = true
                                    viewModel.markSeen(storyId: story.storyId)
                                    print("Current story is presented: \(story.storyId), url: \(story.imageURL)")
                                }
                        } else {
                            ProgressView()
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            viewModel.toggleLike(for: story.storyId)
                        }) {
                            Image(systemName: story.isLiked ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        }

                        Spacer()

                        Button("Close") {
                            presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding()
                }
            } else {
                Text("No more stories")
                    .foregroundColor(.white)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
        }
        .onReceive(timer) { _ in
            guard imageLoaded, currentIndex < viewModel.stories.count else { return }
            if progress < 1.0 {
                progress += 0.01
            } else {
                progress = 0.0
                currentIndex += 1
            }
        }
    }
}

