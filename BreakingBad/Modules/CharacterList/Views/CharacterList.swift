//
//  CharacterList.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI

struct CharacterList: View {
    @ObservedObject var viewModel: CharacterListViewModel
    
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
        CharacterList(viewModel: CharacterListViewModel(networkService: CharacterListNetworkService(client: URLSessionClient())))
    }
}
