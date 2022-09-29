//
//  CharacterList.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI
import Swinject

struct CharacterList: View {
    @ObservedObject private var viewModel: CharacterListViewModel
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List() {
                ForEach($viewModel.filteredCharacters) { character in
                    NavigationLink {
                        let viewModel = Container.CharacterDetailsContainer.resolve(CharacterDetailsViewModel.self,
                                                                                    argument: character.wrappedValue)!
                        CharacterDetails(viewModel: viewModel)
                    } label: {
                        CharacterRow(character: character.wrappedValue)
                    }
                    .listRowSeparator(.hidden)
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
}

struct CharacterList_Previews: PreviewProvider {
    static let viewModel = CharacterListViewModel(networkService: PreviewCharacterListNetworkService())
    static var previews: some View {
        CharacterList(viewModel: viewModel)
    }
}
