//
//  CharacterList.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI

public struct CharacterList: View {
    @ObservedObject private var viewModel: CharacterListViewModel
    
    public init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List($viewModel.filteredCharacters) { character in
            CharacterRow(character: character.wrappedValue)
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
        .searchable(text: $viewModel.searchQuery, prompt: "Search Characters by Name") {
            ForEach($viewModel.filteredCharacters) { character in
                Text(character.wrappedValue.name)
                    .searchCompletion(character.wrappedValue.name)
            }
        }
        .onChange(of: viewModel.searchQuery) { query in
            viewModel.searchQuery = query
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static let viewModel = CharacterListViewModel(networkService: PreviewCharacterListNetworkService())
    static var previews: some View {
        CharacterList(viewModel: viewModel)
    }
}
