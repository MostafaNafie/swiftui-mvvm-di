//
//  CharacterListScreen.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Common

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
                    viewModel.open(character.wrappedValue)
                }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Breaking Bad")
        .onViewDidLoad {
            viewModel.viewDidLoad()
        }
        .searchable(text: $viewModel.searchQuery, prompt: "Search Characters by Name")
        .onChange(of: viewModel.searchQuery) { _, query in
            viewModel.reloadCharacters()
        }
        .errorAlert(error: $viewModel.error)
    }
}

struct CharacterList_Previews: PreviewProvider {
    static let viewModel = CharacterListViewModel(characterListUseCase: .init(networkService: PreviewCharacterListNetworkService()))
    static var previews: some View {
        CharacterListScreen(viewModel: viewModel)
    }
}
