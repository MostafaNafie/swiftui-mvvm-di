//
//  CharacterDetailsScreen.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import SwiftUI
import Kingfisher

public struct CharacterDetailsScreen: View {
    @Bindable var viewModel: CharacterDetailsViewModel

    public init(viewModel: CharacterDetailsViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ScrollView {
            if let character = viewModel.character {
                KFImage(character.imageUrl)
                    .resizable()
                    .ignoresSafeArea(edges: .top)
                    .scaledToFill()
                    .frame(height: 400, alignment: .top)
                    .overlay {
                        Rectangle()
                            .opacity(0.5)
                    }
                    .clipped()

                CircleImageView(imageUrl: character.imageUrl)
                    .offset(y: -225)
                    .padding(.bottom, -280)

                VStack(alignment: .center) {
                    HStack {
                        Text(character.name)
                            .font(.title)
                    }

                    Divider()

                    Text("About \(character.name)")
                        .font(.title2)
                        .padding()
                    Text("Nickname: \(character.nickname)")
                        .font(.body)
                    Text("Birthday: \(character.birthday)")
                        .font(.body)
                }
                .padding()
            } else {
                Text("Loading...")
                    .onViewDidLoad {
                        viewModel.viewDidLoad()
                    }
            }

        }
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CharacterDetailsScreen(viewModel: .preview)
}
