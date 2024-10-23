//
//  CharacterListScreen.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Common
import SwiftUI

public struct CharacterListScreen: View {
    @Bindable private var viewModel: CharacterListViewModel

    public init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        List($viewModel.filteredCharacters) { character in
            CharacterRowView(character: character.wrappedValue)
                .listRowSeparator(.hidden)
                .onNavigation {
                    viewModel.didTapCharacter(with: character.wrappedValue.id)
                }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Breaking Bad")
        .onViewDidLoad {
            await viewModel.viewDidLoad()
        }
        .searchable(
            text: $viewModel.searchQuery,
            prompt: "Search Characters by Name"
        )
        .errorAlert(error: $viewModel.error)
    }
}

#Preview {
    CharacterListScreen(viewModel: CharacterListViewModel.preview)
}
