//
//  CharacterDetailsScreen.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 27/09/2022.
//

import Kingfisher
import SwiftUI

public struct CharacterDetailsScreen: View {
    @StateObject var viewModel: CharacterDetailsViewModel

    public init(viewModel: CharacterDetailsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ScrollView {
            KFImage(viewModel.character.imageUrl)
                .resizable()
                .ignoresSafeArea(edges: .top)
                .scaledToFill()
                .frame(height: 400, alignment: .top)
                .overlay {
                    Rectangle()
                        .opacity(0.5)
                }
                .clipped()

            CircleImageView(imageUrl: viewModel.character.imageUrl)
                .offset(y: -225)
                .padding(.bottom, -280)

            VStack(alignment: .center) {
                HStack {
                    Text(viewModel.character.name)
                        .font(.title)
                }

                Divider()

                Text("About \(viewModel.character.name)")
                    .font(.title2)
                    .padding()
                Text("Nickname: \(viewModel.character.nickname)")
                    .font(.body)
                Text("Birthday: \(viewModel.character.birthday)")
                    .font(.body)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onViewDidLoad {
            await viewModel.viewDidLoad()
        }
    }
}

#Preview {
    CharacterDetailsScreen(viewModel: .preview)
}
