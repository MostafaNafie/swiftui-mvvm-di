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
        List() {
            ForEach($viewModel.characters) { character in
                CharacterRow(character: character.wrappedValue)
                    .listRowInsets(EdgeInsets())
            }
        }
        .background(.gray.opacity(0.25))
        .listStyle(PlainListStyle())
        .onViewDidLoad {
            viewModel.fetchCharacters()
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}
