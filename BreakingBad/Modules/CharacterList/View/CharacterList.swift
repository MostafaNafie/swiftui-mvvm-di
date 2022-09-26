//
//  CharacterList.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Swinject

struct CharacterList: View {
    @ObservedObject private var viewModel: CharacterListViewModel = Container.CharactersListContainer.resolve(CharacterListViewModel.self)!
    
    var body: some View {
        NavigationView {
            List() {
                ForEach($viewModel.filteredCharacters) { character in
                    CharacterRow(character: character.wrappedValue)
                        .listRowInsets(EdgeInsets())
                }
            }
            .searchable(text: $viewModel.searchQuery, prompt: "Search Characters by Name"
            ) {
                ForEach($viewModel.filteredCharacters) { character in
                    Text(character.wrappedValue.name)
                        .searchCompletion(character.wrappedValue.name)
                }
            }
            .onChange(of: viewModel.searchQuery) { _ in
                viewModel.filterCharacters()
            }
            .navigationTitle("Breaking Bad")
            .background(.gray.opacity(0.25))
            .listStyle(PlainListStyle())
            .onViewDidLoad {
                viewModel.fetchCharacters()
            }
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}
