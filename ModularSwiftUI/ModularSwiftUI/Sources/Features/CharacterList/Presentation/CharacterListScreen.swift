//
//  CharacterListScreen.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI

public struct CharacterListScreen: View {
    @Bindable private var viewModel: CharacterListViewModel

    public init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else {
                listView()
            }
        }
        .navigationTitle("Breaking Bad")
        .onViewDidLoad {
            await viewModel.viewDidLoad()
        }
        .errorAlert(error: $viewModel.error)
    }
}

private extension CharacterListScreen {
    func listView() -> some View {
        List($viewModel.filteredCharacters) { character in
            CharacterRowView(character: character.wrappedValue)
                .listRowSeparator(.hidden)
                .onNavigation {
                    await viewModel.didTapCharacter(with: character.wrappedValue.id)
                }
        }
        .listStyle(.plain)
        .searchable(
            text: $viewModel.searchQuery,
            prompt: "Search Characters by Name"
        )
    }
}

#Preview {
    CharacterListScreen(viewModel: CharacterListViewModel.preview)
}
